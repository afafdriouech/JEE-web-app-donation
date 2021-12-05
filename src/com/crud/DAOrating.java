package com.crud;

//import java.util.List;

import com.bean.rating;

public interface DAOrating {
	public void ajouter_rating(rating rt);
    public Double calculer_rating(int id_asso);
}

