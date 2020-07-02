package com.ngonphikp.gplx.Service;

public class APIService {

    public static Dataservice getService(){
        return APIRetrofitClient.getClient().create(Dataservice.class);
    }
}
