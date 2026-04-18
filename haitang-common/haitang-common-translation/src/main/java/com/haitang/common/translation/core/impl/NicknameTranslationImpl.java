package com.haitang.common.translation.core.impl;

import lombok.AllArgsConstructor;
import com.haitang.common.core.service.UserService;
import com.haitang.common.translation.annotation.TranslationType;
import com.haitang.common.translation.constant.TransConstant;
import com.haitang.common.translation.core.TranslationInterface;

/**
 * 用户名称翻译实现
 *
 * @author may
 */
@AllArgsConstructor
@TranslationType(type = TransConstant.USER_ID_TO_NICKNAME)
public class NicknameTranslationImpl implements TranslationInterface<String> {

    private final UserService userService;

    @Override
    public String translation(Object key, String other) {
        if (key instanceof Long id) {
            return userService.selectNicknameById(id);
        }
        return null;
    }
}
