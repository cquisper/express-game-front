package org.palacios.apiservelet.webapp.controller.models;

public class Usuario {
    private Long id;
    private String username;
    private String password;
    //?  recive una categoria el usuario
    private Rol rol;

    //! Formato bean -> util para el sql
    public Usuario(){
    }
    //tipo -> elemento seleccionado en el rol  -> no es necesario pasarlo directamente
    public Usuario(Long id, String username, String password,String tipo) {
        this.id = id;
        this.username = username;
        this.password = password;
        Rol rol = new Rol();
        rol.setNombre(tipo);
        //inicializamos el rol
        this.rol = rol; //ya ytta seseado y con valor
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Rol getRol() {
        return rol;
    }

    public void setRol(Rol rol) {
        this.rol = rol;
    }
}
