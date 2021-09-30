/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unicesar.views;

import com.unicesar.components.TableWithFilterSplit;
import com.vaadin.navigator.View;
import com.vaadin.navigator.ViewChangeListener;
import com.vaadin.server.FontAwesome;
import com.vaadin.ui.Button;
import com.vaadin.ui.Label;
import com.vaadin.ui.Panel;
import com.vaadin.ui.Table;
import com.vaadin.ui.VerticalSplitPanel;

/**
 *
 * @author orenaro
 */
public class RegistrarNotas extends VerticalSplitPanel implements View {

    private Label lblTitulo;
    private Label lblNombreDocente;
    private Label lblFechaLimite;
    private Button btnPublicar;
    private TableWithFilterSplit tblAsignaturas;
    private TableWithFilterSplit tblEstudiantes;
    private Panel panelTblAsignaturas;
    private Panel panelTblEstudiantes;
    
    
    @Override
    public void enter(ViewChangeListener.ViewChangeEvent event) {
        lblTitulo = new Label("Registro de Notas");
        lblNombreDocente = new Label("Boris Gonzalez");
        lblNombreDocente = new Label("01/10/2021");
        btnPublicar = new Button("PUBLICAR", FontAwesome.EYE);
        btnPublicar.setStyleName("verde");
        
        tblAsignaturas = new TableWithFilterSplit("asignatura", null, true);
        tblAsignaturas.addContainerProperty("codigo", Object.class, null, "Codigo", null, Table.Align.CENTER);
        tblAsignaturas.addContainerProperty("asignatura", Object.class, null, "Asignatura", null, Table.Align.CENTER);
        tblAsignaturas.setSizeFull();
        tblAsignaturas.setStyleName("tablafilasdelgadascomponente");
        
        panelTblAsignaturas = new Panel("Listado de Asignaturas", tblAsignaturas);
        panelTblAsignaturas.setSizeFull();
    }
    
}
