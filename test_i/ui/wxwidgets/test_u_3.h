empty                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           dialog_main(wxWindow* parent, wxWindowID id, const wxString& title, const wxPoint& pos=wxDefaultPosition, const wxSize& size=wxDefaultSize, long style=wxDEFAULT_DIALOG_STYLE);

//private:
//  // begin wxGlade: wxDialog_main::methods
////  void set_properties();
////  void do_layout();
//  // end wxGlade

//protected:
//  // begin wxGlade: wxDialog_main::attributes
////  wxButton* button_1;
////  wxButton* button_2;
////  wxButton* button_3;
//  // end wxGlade

////  DECLARE_EVENT_TABLE();

//public:
//  void button_1_clicked_cb(wxCommandEvent &event); // wxGlade: <event_handler>
//  void button_2_clicked_cb(wxCommandEvent &event); // wxGlade: <event_handler>
//  void button_3_clicked_cb(wxCommandEvent &event); // wxGlade: <event_handler>
//}; // wxGlade: end class

//////////////////////////////////////////

extern const char toplevel_widget_classname_string_[];
typedef Common_UI_WxWidgetsXRCDefinition_T<struct Common_UI_wxWidgets_State,
                                           toplevel_widget_classname_string_> Test_U_WxWidgetsXRCDefinition_t;
typedef Common_UI_wxWidgets_IApplication_T<struct Common_UI_wxWidgets_State,
                                           struct Common_UI_wxWidgets_CBData> Test_U_WxWidgetsIApplication_t;
typedef Test_U_WxWidgetsDialog_T<dialog_main_base,
                                 Test_U_WxWidgetsIApplication_t> Test_U_WxWidgetsDialog_t;
typedef Comon_UI_WxWidgets_Application_T<Test_U_WxWidgetsXRCDefinition_t,
                                         struct Common_UI_wxWidgets_State,
                                         struct Common_UI_wxWidgets_CBData,
                                         Test_U_WxWidgetsDialog_t,
                                         wxGUIAppTraits> Test_U_WxWidgetsApplication_t;

#endif // TEST_U_3_H
