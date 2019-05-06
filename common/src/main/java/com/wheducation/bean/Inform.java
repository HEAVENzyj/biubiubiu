package com.wheducation.bean;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

/**
 * @description:通知表
 * @author: zhangyoujun
 * @date: 2019-04-28 13:58
 */
public class Inform  implements Serializable {

    private Integer id;

    private String inf_U_name;

    private String inf_headline;

    private String inf_content;

    private String inf_createtime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getInf_U_name() {
        return inf_U_name;
    }

    public void setInf_U_name(String inf_U_name) {
        this.inf_U_name = inf_U_name;
    }

    public String getInf_headline() {
        return inf_headline;
    }

    public void setInf_headline(String inf_headline) {
        this.inf_headline = inf_headline;
    }

    public String getInf_content() {
        return inf_content;
    }

    public void setInf_content(String inf_content) {
        this.inf_content = inf_content;
    }

    public String getInf_createtime() {
        return inf_createtime;
    }

    public void setInf_createtime(String inf_createtime) {
        this.inf_createtime = inf_createtime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Inform inform = (Inform) o;
        return Objects.equals(id, inform.id) &&
                Objects.equals(inf_U_name, inform.inf_U_name) &&
                Objects.equals(inf_headline, inform.inf_headline) &&
                Objects.equals(inf_content, inform.inf_content) &&
                Objects.equals(inf_createtime, inform.inf_createtime);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, inf_U_name, inf_headline, inf_content, inf_createtime);
    }

    @Override
    public String toString() {
        return "Inform{" +
                "id=" + id +
                ", inf_U_name='" + inf_U_name + '\'' +
                ", inf_headline='" + inf_headline + '\'' +
                ", inf_content='" + inf_content + '\'' +
                ", inf_createtime=" + inf_createtime +
                '}';
    }

    public Inform (){

    }
}
