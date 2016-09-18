#ifndef COMMON_MATH_FFT_H
#define COMMON_MATH_FFT_H

#include <complex>

#include "ace/Assert.h"
#include "ace/Global_Macros.h"

#include "common_math_exports.h"

class Common_Math_Export SampleIterator
{
 public:
  SampleIterator (char*); // buffer
  virtual ~SampleIterator ();

  bool initialize (unsigned int, // bytes / 'data sample' (i.e. sizeof ('sound sample') * channels)
                   unsigned int, // resolution: bytes per 'sound sample'
                   bool,         // signed 'sound sample' format ?
                   int);         // 'sound sample' byte order (ACE-style, 0: N/A)
  double get (unsigned int,  // index (i.e. #sample into buffer)
              unsigned int); // channel index (i.e. 0: mono/stereo left,
                             //                     1: stereo right, ...)

  char*        buffer_;
  unsigned int dataSampleSize_;
  bool         reverseEndianness_;
  unsigned int soundSampleSize_;

 private:
  ACE_UNIMPLEMENTED_FUNC (SampleIterator ())
  ACE_UNIMPLEMENTED_FUNC (SampleIterator (const SampleIterator&))
  ACE_UNIMPLEMENTED_FUNC (SampleIterator& operator= (const SampleIterator&))

  bool         isInitialized_;
  bool         isSignedSampleFormat_;
  int          sampleByteOrder_; // ACE-style, 0: N/A
};

//////////////////////////////////////////

//template <unsigned int BitsPerSample,   // resolution: bits per sample
//          unsigned int SampleByteOrder> // sample byte order
class Common_Math_Export Common_Math_FFT
{
 public:
  //typedef SampleIterator_T<false,
  //                         BitsPerSample,
  //                         SampleByteOrder> ITERATOR_T;

  Common_Math_FFT (unsigned int,  // #channels
                   unsigned int,  // #slots (must be a power of 2)
                   unsigned int); // sample rate (Hz)
  virtual ~Common_Math_FFT ();

  bool Initialize (unsigned int,  // #channels
                   unsigned int,  // #slots (must be a power of 2)
                   unsigned int); // sample rate (Hz)

  //void                CopyIn (unsigned int, // channel
  //                            ITERATOR_T*); // sample iterator
  inline unsigned int Slots () const { return slots_; }
  void                Transform (unsigned int); // channel

  inline double       Intensity (unsigned int channel_in,
                                 unsigned int slot_in) const
  { 
    ACE_ASSERT (channel_in < channels_);
    ACE_ASSERT (slot_in < slots_);
    return (sqrt (norm (X_[channel_in][slot_in])) / sqrtSlots_);
  }

  // return frequency in Hz of a given slot
  inline unsigned int Frequency (unsigned int slot_in) const
  {
    ACE_ASSERT (slot_in < slots_);
    return (static_cast<unsigned int> (sampleRate_ * slot_in) / slots_);
  }
  inline unsigned int HzToSlot (unsigned int frequency_in) const 
  { 
    return (static_cast<unsigned int> (slots_ * frequency_in) / sampleRate_);
  }

  inline unsigned int MaxFrequency () const { return sampleRate_; }

  inline int          Value (unsigned int channel_in,
                             unsigned int slot_in) const
  {
    ACE_ASSERT (channel_in < channels_);
    ACE_ASSERT (slot_in < slots_);
    return static_cast<int> (buffer_[channel_in][slot_in]);
  }

 protected:
  double**               buffer_;        // sample data [/channel]
  std::complex<double>** X_;             // 'in-place' working buffer [/channel]

  int*                   bitReverseMap_; // bit-reverse vector mapping
  unsigned int           channels_;      // #channels
  unsigned int           slots_;         // buffered samples / channel
  unsigned int           sampleRate_;

 private:
  ACE_UNIMPLEMENTED_FUNC (Common_Math_FFT ())
  ACE_UNIMPLEMENTED_FUNC (Common_Math_FFT (const Common_Math_FFT&))
  ACE_UNIMPLEMENTED_FUNC (Common_Math_FFT& operator= (const Common_Math_FFT&))

  int                    logSlots_;
  double                 sqrtSlots_;
  std::complex<double>** W_;             // exponentials

  bool                   isInitialized_;
};

#endif
