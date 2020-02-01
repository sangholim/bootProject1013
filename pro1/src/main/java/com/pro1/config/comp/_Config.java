package com.pro1.config.comp;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import com.pro1.config.comp.database._Database;
import com.pro1.config.comp.security._Security;

@XmlRootElement(name = "config")
public class _Config {

    private _Database database;

    private _Security security;

    private String timezone;

    private String store;

    @XmlElement(name = "database")
    public _Database getDatabase() {
	return database;
    }

    public void setDatabase(_Database database) {
	this.database = database;
    }

    @XmlElement(name = "security")
    public _Security getSecurity() {
	return security;
    }

    public void setSecurity(_Security security) {
	this.security = security;
    }

    @XmlElement(name = "timezone")
    public String getTimezone() {
	return timezone;
    }

    public void setTimezone(String timezone) {
	this.timezone = timezone;
    }

    public String getStore() {
	return store;
    }

    public void setStore(String store) {
	this.store = store;
    }

}
