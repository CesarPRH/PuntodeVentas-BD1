/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Cesar S
 */
public class ClienteModel {
    
    private String nombre;
    private String email;
    private String nit;
    private String estado;
    private int telefono;
    
    public ClienteModel(){
        
    }

    public ClienteModel(String nombre, String email, String nit, String estado, int telefono) {
        this.nombre = nombre;
        this.email = email;
        this.nit = nit;
        this.estado = estado;
        this.telefono = telefono;
    }

    public String getNombre() {
        return nombre;
    }

    public String getEmail() {
        return email;
    }

    public String getNit() {
        return nit;
    }

    public String getEstado() {
        return estado;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }
    
}
