// -*- C++ -*-
//
// generated by wxGlade 0.8.3 on Wed Mar 20 13:54:00 2019
//
// Example for compiling a single file project under Linux using g++:
//  g++ MyApp.cpp $(wx-config --libs) $(wx-config --cxxflags) -o MyApp
//
// Example for compiling a multi file project under Linux using g++:
//  g++ main.cpp $(wx-config --libs) $(wx-config --cxxflags) -o MyApp Dialog1.cpp Frame1.cpp
//

#ifndef TEST_U_3_UI_BASE_H
#define TEST_U_3_UI_BASE_H

#include <wx/wx.h>
#include <wx/image.h>

// begin wxGlade: ::dependencies
// end wxGlade

// begin wxGlade: ::extracode
// end wxGlade


class dialog_main_base: public wxDialog {
public:
  // begin wxGlade: dialog_main_base::ids
  // end wxGlade

  dialog_main_base(wxWindow* parent, wxWindowID id, const wxString& title, const wxPoint& pos=wxDefaultPosition, const wxSize& size=wxDefaultSize, long style=wxDEFAULT_DIALOG_STYLE);

private:
  // begin wxGlade: dialog_main_base::methods
  void set_properties();
  void do_layout();
  // end wxGlade

protected:
  // begin wxGlade: dialog_main_base::attributes
  wxButton* button_1;
  wxButton* button_2;
  wxButton* button_3;
  // end wxGlade

//  DECLARE_EVENT_TABLE();

public:
  void button_1_clicked_cb(wxCommandEvent &event); // wxGlade: <event_handler>
  void button_2_clicked_cb(wxCommandEvent &event); // wxGlade: <event_handler>
  void button_3_clicked_cb(wxCommandEvent &event); // wxGlade: <event_handler>
}; // wxGlade: end class


#endif // TEST_U_3_UI_BASE_H
