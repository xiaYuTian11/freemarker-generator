package com.zenith.front.controller;

import com.zenith.common.domain.vo.PageVO;
import com.zenith.core.result.R;
import com.zenith.front.api.TeacherService;
import com.zenith.front.domain.dto.TeacherDTO;
import com.zenith.front.domain.dto.TeacherListDTO;
import com.zenith.front.domain.vo.TeacherVO;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotNull;
import java.util.Objects;

/**
* @author TMW
* @date 2021/2/22 14:14
*/
@RestController
@RequestMapping("/teacher")
@Validated
public class TeacherController {

@Autowired
@Reference
private TeacherService teacherService;

/**
* 新增
*/
@PostMapping("/save")
public R save(@Validated @RequestBody TeacherDTO dto) {
Long id = teacherService.save(dto);
return Objects.isNull(id) ? R.fail() : R.ok(id);
}

/**
* 详情
*/
@PostMapping("/find/{id}")
public R find(@NotNull(message = "id 不能为空") @PathVariable Long id) {
TeacherVO vo = teacherService.findById(id);
return R.ok(vo);
}

/**
* 修改
*/
@PostMapping("/update")
public R update(@Validated @RequestBody TeacherDTO dto) {
boolean flag = teacherService.update(dto);
return flag ? R.ok() : R.fail();
}

/**
* 删除
*/
@PostMapping("/delete/{id}")
public R delete(@NotNull(message = "id 不能为空") @PathVariable Long id) {
boolean flag = teacherService.delete(id);
return flag ? R.ok() : R.fail();
}

/**
* 列表
*/
@PostMapping("/list")
public R list(@Validated @RequestBody TeacherListDTO dto) {
final PageVO<?> pageVO = teacherService.list(dto);
return R.ok(pageVO);
}
}
