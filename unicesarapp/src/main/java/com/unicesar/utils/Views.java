
package com.unicesar.utils;

import com.vaadin.navigator.Navigator;
import com.unicesar.views.RegistrarNotas;


public class Views {
    
    public static final String MAIN = "MAINVIEW";
    public static final String LOGIN = "LOGINVIEW";
    public static final String REGISTRARNOTAS = "REGISTRARNOTASVIEW";
    
    
    public static void setViewsUI(Navigator vNavigator){
//        vNavigator.addView(Views.LOGIN, LoginView.class);
//        vNavigator.addView(Views.MAIN, MainView.class);
        vNavigator.addView(Views.REGISTRARNOTAS, RegistrarNotas.class);
        
    }
//    
//    public static Boolean ValidateViews(String vista){
//        ArrayList<String> view_Current_User = new ArrayList<>();
//        view_Current_User.clear();
//        view_Current_User.add(MAIN);
//        view_Current_User.add(LOGIN);
//        view_Current_User.add(TURNOSPANTALLA);
//        view_Current_User.add(TURNOSASIGNACION);
//        view_Current_User.add(SOPORTECNOLOGIA);
//        
//        if (UI.getCurrent().getSession().getAttribute(VariablesSesion.CURRENT_USER) != null){
//            GestionDB objConnect = null;
//
//            try {
//                objConnect = new GestionDB();
//                ResultSet rsViewMenu = objConnect.consultar("SELECT m.view_name FROM menu m "
//                + "INNER JOIN menu_app_users mau ON m.name_menu = mau.name_menu "
//                + "WHERE BINARY mau.login = '" + 
//                    UI.getCurrent().getSession().getAttribute(VariablesSesion.CURRENT_USER) + "'");
//
//                while (rsViewMenu.next()) {
//                    view_Current_User.add(rsViewMenu.getString("view_name"));
//                }
//            } catch (SQLException | NullPointerException | NamingException ex) {
//                Logger.getLogger(Views.class.getName()).log(Level.SEVERE, SeveralProcesses.getSessionUser(), ex.getMessage());
//                Notification.show(ex.getMessage(), Notification.Type.ERROR_MESSAGE);
//            } finally {
//                try {
//                    if (objConnect != null)
//                        objConnect.desconectar();
//                } catch (SQLException ex) {
//                    Logger.getLogger(Views.class.getName()).log(Level.SEVERE, "Cerrando Conexión - " + SeveralProcesses.getSessionUser(), ex);
//                }
//            }
//        }
//        
//        return (view_Current_User.contains(vista));
//    }
    
}
