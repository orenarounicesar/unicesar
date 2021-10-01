
package com.unicesar.businesslogic;

import com.unicesar.utils.SeveralProcesses;
import com.vaadin.data.util.converter.Converter;
import java.util.Locale;

public class StringToStringGrid implements Converter<String, String> {
    
    private final String vTabla;
    private final String vCodigo;
    private final String vNombre;
    private final String vServidor;

    public StringToStringGrid(String vTabla, String vCodigo, String vNombre) {
        this.vTabla = vTabla;
        this.vCodigo = vCodigo;
        this.vNombre = vNombre;
        this.vServidor = null;
    }        

    public StringToStringGrid(String vTabla, String vCodigo, String vNombre, String servidor) {
        this.vTabla = vTabla;
        this.vCodigo = vCodigo;
        this.vNombre = vNombre;
        this.vServidor = servidor;
    }        

    @Override
    public String convertToModel(String value, Class<? extends String> targetType, Locale locale) throws ConversionException {
        throw new ConversionException("Not supported");
    }

    @Override
    public String convertToPresentation(String value, Class<? extends String> targetType, Locale locale) throws ConversionException {
        if (value == null)
            return null;
        if (vServidor == null) {
            return SeveralProcesses.retornarInformacion(vTabla, vCodigo, vNombre, Integer.valueOf(value));
        } else {
            return SeveralProcesses.retornarInformacion(vTabla, vCodigo, vNombre, Integer.valueOf(value), vServidor);
        }
//        return SeveralProcesses.RetornarInformacion(vTabla, vCodigo, vNombre, Integer.valueOf(value));
    }

    @Override
    public Class<String> getModelType() {
        return String.class;
    }

    @Override
    public Class<String> getPresentationType() {
        return String.class;
    }
    
}
