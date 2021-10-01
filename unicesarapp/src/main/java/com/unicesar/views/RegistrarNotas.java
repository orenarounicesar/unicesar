/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unicesar.views;

import com.unicesar.businesslogic.GestionDB;
import com.unicesar.components.NumberFieldCustom;
import com.unicesar.components.TableWithFilterSplit;
import com.unicesar.utils.SeveralProcesses;
import com.unicesar.utils.VariablesSesion;
import com.vaadin.navigator.View;
import com.vaadin.navigator.ViewChangeListener;
import com.vaadin.server.FontAwesome;
import com.vaadin.server.Sizeable;
import com.vaadin.shared.ui.MarginInfo;
import com.vaadin.shared.ui.label.ContentMode;
import com.vaadin.ui.Alignment;
import com.vaadin.ui.Button;
import com.vaadin.ui.GridLayout;
import com.vaadin.ui.HorizontalLayout;
import com.vaadin.ui.Label;
import com.vaadin.ui.Panel;
import com.vaadin.ui.Table;
import com.vaadin.ui.UI;
import com.vaadin.ui.VerticalSplitPanel;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;

/**
 *
 * @author orenaro
 */
public class RegistrarNotas extends VerticalSplitPanel implements View {

    private Label lblTitulo;
    private Label lblNombreDocente;
    private Label lblFechaLimite;
    private Button btnPublicar;
    private GridLayout layoutCabecera;
    private TableWithFilterSplit tblAsignaturas;
    private TableWithFilterSplit tblEstudiantes;
    private Panel panelTblAsignaturas;
    private Panel panelTblEstudiantes;
    private HorizontalLayout layoutTablas;
    
    private String cadenaSql;
    
    @Override
    public void enter(ViewChangeListener.ViewChangeEvent event) {
        lblTitulo = new Label("Registro de Notas");
        lblTitulo.setWidthUndefined();
        lblTitulo.setStyleName("titulo");
        lblTitulo.addStyleName("textoEnormeRojo");
        lblNombreDocente = new Label("Docente: <strong>" + getNombreDocente() + "</strong>", ContentMode.HTML);
        lblNombreDocente.setWidthUndefined();
        lblFechaLimite = new Label("Fecha Limite: <strong>01/10/2021</strong>", ContentMode.HTML);
        lblFechaLimite.setWidthUndefined();
        btnPublicar = new Button("PUBLICAR", FontAwesome.EYE);
        btnPublicar.setStyleName("verde");
        
        layoutCabecera = new GridLayout(3, 2);
        layoutCabecera.addComponent(lblTitulo, 0, 0, 2, 0);
        layoutCabecera.addComponent(lblNombreDocente, 0, 1);
        layoutCabecera.addComponent(lblFechaLimite, 1, 1);
        layoutCabecera.addComponent(btnPublicar, 2, 1);
        layoutCabecera.setWidth("100%");
        layoutCabecera.setMargin(new MarginInfo(false, true, false, true));
        layoutCabecera.setSpacing(true);
        layoutCabecera.setComponentAlignment(lblTitulo, Alignment.MIDDLE_CENTER);
        layoutCabecera.setComponentAlignment(lblNombreDocente, Alignment.MIDDLE_LEFT);
        layoutCabecera.setComponentAlignment(lblFechaLimite, Alignment.MIDDLE_CENTER);
        layoutCabecera.setComponentAlignment(btnPublicar, Alignment.MIDDLE_RIGHT);
        
        tblAsignaturas = new TableWithFilterSplit("asignatura", null, true);
        tblAsignaturas.addContainerProperty("codigo", Object.class, null, "Codigo", null, Table.Align.CENTER);
        tblAsignaturas.addContainerProperty("asignatura", Object.class, null, "Asignatura", null, Table.Align.CENTER);
        tblAsignaturas.setSizeFull();
        tblAsignaturas.setStyleName("tablafilasdelgadascomponente");
        panelTblAsignaturas = new Panel("Listado de Asignaturas", tblAsignaturas);
        panelTblAsignaturas.setSizeFull();
        panelTblAsignaturas.setStyleName("panelverde");
        panelTblAsignaturas.addStyleName("bordeverde");
        
        tblEstudiantes = new TableWithFilterSplit("estudiante", null, true);
        tblEstudiantes.addContainerProperty("codigo", Object.class, null, "Codigo", null, Table.Align.CENTER);
        tblEstudiantes.addContainerProperty("estudiante", Object.class, null, "Estudiante", null, Table.Align.CENTER);
        tblEstudiantes.addContainerProperty("id", Object.class, null, "Identificación", null, Table.Align.CENTER);
        tblEstudiantes.addContainerProperty("nota", NumberFieldCustom.class, null, "Nota", null, Table.Align.CENTER);
        tblEstudiantes.setSizeFull();
        tblEstudiantes.setStyleName("tablafilasdelgadascomponente");
        panelTblEstudiantes = new Panel("Listado de Estudiantes", tblEstudiantes);
        panelTblEstudiantes.setSizeFull();
        panelTblEstudiantes.setStyleName("panelverde");
        panelTblEstudiantes.addStyleName("bordeverde");
        
        layoutTablas = new HorizontalLayout(panelTblAsignaturas, panelTblEstudiantes);
        layoutTablas.setSizeFull();
        layoutTablas.setMargin(false);
        layoutTablas.setSpacing(true);
        
        addComponents(layoutCabecera, layoutTablas);
        setSizeFull();
        setSplitPosition(85, Sizeable.Unit.PIXELS);
        setStyleName("fondoaplicacion");
    }
    
    private String getNombreDocente() {
        cadenaSql = "SELECT "
                + "CONCAT_WS(' ',a.nombre1, a.nombre2, a.apellido1, a.apellido2) AS nombre_docente "
            + "FROM datos_personales a "
            + "INNER JOIN docentes b ON b.codigo_dato_personal = a.codigo_dato_personal AND b.codigo_docente = " + UI.getCurrent().getSession().getAttribute(VariablesSesion.CODIGO_DOCENTE)
            ;
        GestionDB objConnect = null;
        try {
            objConnect = new GestionDB();
            ResultSet rs = objConnect.consultar(cadenaSql);
            if ( rs.next() ) {
                return rs.getString(1);
            }
        } catch (NamingException | SQLException ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, cadenaSql + " - " + SeveralProcesses.getSessionUser(), ex);
        } finally {
            try {
                if (objConnect != null) {
                    objConnect.desconectar();
                }
            } catch (SQLException ex) {
                Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "Cerrando Conexión - " + SeveralProcesses.getSessionUser(), ex);
            }
        }
        return null;
    }
}
