package com.ssafy.happyhouse.model;


//환경점검 
public class Environment {

 // index 
 private Integer no;

 // 업체명 
 private String name;

 // 점검종류 
 private String category;

 // 점검일자 
 private String date;

 // 점검기관_구 
 private String checkGu;

 // 점검주기 
 private String period;

 // 처분여부 
 private String disposed;

 // 주소(동포함) 
 private String addressDong;

 // 주소 
 private String address;

 public Integer getNo() {
     return no;
 }

 public void setNo(Integer no) {
     this.no = no;
 }

 public String getName() {
     return name;
 }

 public void setName(String name) {
     this.name = name;
 }

 public String getCategory() {
     return category;
 }

 public void setCategory(String category) {
     this.category = category;
 }

 public String getDate() {
     return date;
 }

 public void setDate(String date) {
     this.date = date;
 }

 public String getCheckGu() {
     return checkGu;
 }

 public void setCheckGu(String checkGu) {
     this.checkGu = checkGu;
 }

 public String getPeriod() {
     return period;
 }

 public void setPeriod(String period) {
     this.period = period;
 }

 public String getDisposed() {
     return disposed;
 }

 public void setDisposed(String disposed) {
     this.disposed = disposed;
 }

 public String getAddressDong() {
     return addressDong;
 }

 public void setAddressDong(String addressDong) {
     this.addressDong = addressDong;
 }

 public String getAddress() {
     return address;
 }

 public void setAddress(String address) {
     this.address = address;
 }

 // Environment 모델 복사
 public void CopyData(Environment param)
 {
     this.no = param.getNo();
     this.name = param.getName();
     this.category = param.getCategory();
     this.date = param.getDate();
     this.checkGu = param.getCheckGu();
     this.period = param.getPeriod();
     this.disposed = param.getDisposed();
     this.addressDong = param.getAddressDong();
     this.address = param.getAddress();
 }
}
