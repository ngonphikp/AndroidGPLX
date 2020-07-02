package com.ngonphikp.gplx.Model;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class ThiSatHach {

@SerializedName("Current")
@Expose
private Integer current;
@SerializedName("Size")
@Expose
private Integer size;
@SerializedName("Time")
@Expose
private Integer time;
@SerializedName("Condition")
@Expose
private Integer condition;

public Integer getCurrent() {
return current;
}

public void setCurrent(Integer current) {
this.current = current;
}

public Integer getSize() {
return size;
}

public void setSize(Integer size) {
this.size = size;
}

public Integer getTime() {
return time;
}

public void setTime(Integer time) {
this.time = time;
}

public Integer getCondition() {
return condition;
}

public void setCondition(Integer condition) {
this.condition = condition;
}

}