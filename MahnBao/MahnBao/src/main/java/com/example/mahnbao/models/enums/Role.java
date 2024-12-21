package com.example.mahnbao.models.enums;

import org.springframework.security.core.GrantedAuthority;

public enum Role implements GrantedAuthority {
    ROLE_ADMIN,
    ROLE_MANAGER,
    ROLE_GUEST;

    @Override
    public String getAuthority() {
        return name();
    }
}
