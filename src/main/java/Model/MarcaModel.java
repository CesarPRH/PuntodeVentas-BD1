/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Cesar S
 */
public class MarcaModel {
    private String nombre;
    private String pais_origen;
    private String estado;

    public MarcaModel(String nombre, String pais_origen, String estado) {
        this.nombre = nombre;
        this.pais_origen = pais_origen;
        this.estado = estado;
    }

    public String getNombre() {
        return nombre;
    }

    public String getPais_origen() {
        return pais_origen;
    }

    public String getEstado() {
        return estado;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setPais_origen(String pais_origen) {
        this.pais_origen = pais_origen;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    
    
}
