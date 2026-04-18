# 海棠智慧仓ERP 开发文档

## 项目概述

海棠智慧仓ERP是一款基于RuoYi-Vue-Plus框架的开源进销存管理系统，采用SpringBoot+Vue3前后端分离架构，支持SaaS多租户模式。系统适用于中小企业，提供采购管理、销售管理、库存管理、财务管理等核心功能。

**项目地址**: https://gitee.com/dromara/haitang-Vue-Plus
**版本**: 5.1.2
**许可证**: MIT License

---

## 技术架构

### 核心技术栈

| 技术 | 版本 | 说明 |
|------|------|------|
| Spring Boot | 3.1.7 | 基础框架 |
| Java | 17 | 开发语言 |
| MyBatis-Plus | 3.5.4 | ORM框架 |
| Sa-Token | 1.37.0 | 认证授权 |
| Redisson | 3.24.3 | Redis客户端 |
| EasyExcel | 3.3.3 | Excel处理 |
| Springdoc | 2.2.0 | Swagger文档 |
| Hutool | 5.8.22 | Java工具库 |
| PowerJob | 4.3.6 | 分布式任务调度 |

### 项目结构

```
qixiu-erp/
├── haitang-admin/              # 管理后台启动模块
│   └── src/main/java/com/haitang/
│       ├── web/controller/         # Web控制器
│       ├── web/service/            # 认证服务
│       └── DromaraApplication.java # 启动类
│
├── haitang-common/             # 公共模块
│   ├── haitang-common-core/        # 核心基础
│   ├── haitang-common-security/    # 安全认证
│   ├── haitang-common-redis/       # Redis缓存
│   ├── haitang-common-mybatis/     # MyBatis增强
│   ├── haitang-common-satoken/     # Sa-Token配置
│   ├── haitang-common-tenant/      # 多租户
│   ├── haitang-common-excel/       # Excel导入导出
│   ├── haitang-common-log/         # 日志记录
│   ├── haitang-common-web/         # Web配置
│   ├── haitang-common-websocket/   # WebSocket
│   ├── haitang-common-encrypt/     # 加密模块
│   ├── haitang-common-idempotent/  # 幂等控制
│   ├── haitang-common-ratelimiter/ # 限流
│   ├── haitang-common-oss/         # 对象存储
│   ├── haitang-common-sms/         # 短信服务
│   ├── haitang-common-mail/        # 邮件服务
│   └── haitang-common-social/      # 社交登录
│
├── haitang-extend/             # 扩展服务
│   ├── haitang-monitor-admin/      # 监控中心
│   └── haitang-powerjob-server/    # 定时任务
│
└── haitang-modules/            # 业务模块
    ├── haitang-demo/              # 示例代码
    ├── haitang-generator/         # 代码生成器
    ├── haitang-job/               # 任务调度
    ├── haitang-system/            # 系统模块
    └── haitang-erp/               # ERP业务模块
```

---

## ERP模块详解

### 模块结构

```
haitang-erp/
├── controller/                    # 控制器层
│   ├── ErpCustomerController.java         # 客户管理
│   ├── ErpProductController.java          # 产品管理
│   ├── ErpProductCategoryController.java  # 产品分类
│   ├── ErpProductUnitController.java      # 单位管理
│   ├── ErpSupplierController.java         # 供应商管理
│   ├── ErpWarehouseController.java        # 仓库管理
│   ├── finance/                           # 财务管理
│   │   └── ErpAccountController.java
│   └── purchase/                          # 采购管理
│       ├── ErpPurchaseOrderController.java    # 采购订单
│       └── ErpPurchaseInController.java       # 采购入库
│
├── domain/                        # 领域对象
│   ├── ErpProduct.java                # 产品实体
│   ├── ErpCustomer.java               # 客户实体
│   ├── ErpSupplier.java               # 供应商实体
│   ├── ErpWarehouse.java              # 仓库实体
│   ├── ErpProductCategory.java        # 产品分类实体
│   ├── ErpProductUnit.java            # 单位实体
│   ├── bo/                            # 业务对象
│   ├── vo/                            # 视图对象
│   ├── purchase/                      # 采购领域对象
│   │   ├── ErpPurchaseOrder.java      # 采购订单
│   │   ├── ErpPurchaseOrderItem.java  # 采购订单明细
│   │   ├── ErpPurchaseIn.java         # 采购入库单
│   │   └── ErpPurchaseInItem.java     # 采购入库明细
│   └── finance/                       # 财务领域对象
│       └── ErpAccount.java            # 账户实体
│
├── service/                       # 业务逻辑层
│   ├── IErpXxxService.java            # 业务接口
│   ├── impl/                          # 业务实现
│   │   └── ErpXxxServiceImpl.java
│   └── purchase/                      # 采购服务
│
├── mapper/                        # 数据访问层
│   └── ErpXxxMapper.java
│
├── enums/                         # 枚举类
│   ├── DictTypeConstants.java         # 字典常量
│   ├── ErpAuditStatus.java            # 审核状态
│   ├── ErrorCodeConstants.java        # 错误码
│   └── LogRecordConstants.java        # 日志记录常量
│
└── resources/mapper/erp/          # MyBatis XML映射文件
    ├── ErpProductMapper.xml
    ├── ErpCustomerMapper.xml
    └── purchase/
        ├── ErpPurchaseOrderMapper.xml
        └── ErpPurchaseInMapper.xml
```

### 核心功能模块

#### 1. 基础资料管理

| 模块 | 实体类 | 功能说明 |
|------|--------|----------|
| 客户管理 | `ErpCustomer` | 客户信息维护、联系人管理 |
| 产品管理 | `ErpProduct` | 商品信息、条码、采购价、销售价管理 |
| 产品分类 | `ErpProductCategory` | 商品分类树形结构 |
| 单位管理 | `ErpProductUnit` | 计量单位维护 |
| 供应商管理 | `ErpSupplier` | 供应商信息、联系方式 |
| 仓库管理 | `ErpWarehouse` | 仓库信息配置 |

#### 2. 采购管理

| 模块 | 实体类 | 功能说明 |
|------|--------|----------|
| 采购订单 | `ErpPurchaseOrder` | 采购询价、下单、审核 |
| 采购订单明细 | `ErpPurchaseOrderItem` | 订单商品明细 |
| 采购入库 | `ErpPurchaseIn` | 采购收货入库 |
| 采购入库明细 | `ErpPurchaseInItem` | 入库商品明细 |

#### 3. 财务管理

| 模块 | 实体类 | 功能说明 |
|------|--------|----------|
| 账户管理 | `ErpAccount` | 资金账户管理、结算 |

### 实体类设计规范

所有ERP实体类继承 `TenantEntity`，支持多租户数据隔离：

```java
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("erp_product")
public class ErpProduct extends TenantEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    @TableId(value = "id")
    private Long id;

    private String name;               // 产品名称
    private String barCode;            // 产品条码
    private Long categoryId;           // 产品分类编号
    private Long unitId;               // 单位编号
    private Long status;               // 产品状态
    private String standard;           // 产品规格
    private String remark;             // 产品备注
    private Long expiryDay;            // 保质期天数
    private BigDecimal weight;         // 基础重量（kg）
    private BigDecimal purchasePrice;  // 采购价格
    private BigDecimal salePrice;      // 销售价格
}
```

### 采购订单实体示例

```java
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("erp_purchase_order")
public class ErpPurchaseOrder extends TenantEntity {

    @TableId(value = "id")
    private Long id;

    private String no;                    // 采购单编号
    private Integer status;               // 采购状态
    private Long supplierId;              // 供应商
    private Long accountId;               // 结算账户
    private Date orderTime;               // 订单时间
    private BigDecimal totalCount;        // 合计数量
    private BigDecimal totalPrice;        // 合计价格
    private BigDecimal totalProductPrice; // 合计产品价格
    private BigDecimal totalTaxPrice;     // 合计税额
    private BigDecimal discountPrice;     // 优惠金额
    private BigDecimal discountRate;      // 优惠率
    private BigDecimal depositPrice;      // 定金
    private Integer receiptStatus;        // 收款状态
    private Integer receiptPrice;         // 收款金额
    private String remark;                // 备注
    private String fileUrl;               // 附件地址
}
```

---

## 开发规范

### 命名规范

| 类型 | 规范 | 示例 |
|------|------|------|
| Controller | `ErpXxxController` | `ErpProductController` |
| Service接口 | `IErpXxxService` | `IErpProductService` |
| Service实现 | `ErpXxxServiceImpl` | `ErpProductServiceImpl` |
| Mapper | `ErpXxxMapper` | `ErpProductMapper` |
| 实体类 | `ErpXxx` | `ErpProduct` |
| BO类 | `ErpXxxBo` | `ErpProductBo` |
| VO类 | `ErpXxxVo` | `ErpProductVo` |
| Mapper XML | `ErpXxxMapper.xml` | `ErpProductMapper.xml` |

### 目录分层

```
com.haitang.erp
├── controller/     # RESTful API控制器
├── domain/         # 领域对象
│   ├── bo/         # 业务对象（Business Object）
│   ├── vo/         # 视图对象（View Object）
│   ├── purchase/   # 按模块分包
│   └── finance/
├── service/        # 业务接口
│   ├── impl/       # 业务实现
│   └── purchase/
├── mapper/         # 数据访问层
├── enums/          # 枚举类
└── utils/          # 工具类
```

### 多租户实现

实体类继承 `TenantEntity` 自动实现租户隔离：

```java
public class TenantEntity implements Serializable {
    private Long tenantId;      // 租户ID
    private Long createBy;      // 创建者
    private Date createTime;    // 创建时间
    private Long updateBy;      // 更新者
    private Date updateTime;    // 更新时间
}
```

---

## 配置说明

### 环境配置

| 环境 | 激活Profile | 日志级别 | 说明 |
|------|------------|----------|------|
| 本地 | `local` | info | 本地开发环境 |
| 开发 | `dev` | info | 默认环境 |
| 生产 | `prod` | warn | 生产环境 |

### 关键配置项

```yaml
server:
  port: 8080
  servlet:
    context-path: /

spring:
  application:
    name: haitang-Vue-Plus
  profiles:
    active: @profiles.active@
  servlet:
    multipart:
      max-file-size: 10MB
      max-request-size: 20MB
  jackson:
    date-format: yyyy-MM-dd HH:mm:ss

sa-token:
  token-name: Authorization
  is-concurrent: true
  is-share: false

ruoyi:
  name: haitang-Vue-Plus
  version: ${revision}
  copyrightYear: 2023

captcha:
  enable: true
  type: MATH
  category: CIRCLE

user:
  password:
    maxRetryCount: 5
    lockTime: 10
```

### 数据库配置

数据库配置位于 `application-dev.yml` 或 `application-prod.yml`：

```yaml
spring:
  datasource:
    driver-class-name: com.mysql.cj.jdbc.Driver
    url: jdbc:mysql://localhost:3306/haitang_erp?useUnicode=true&characterEncoding=utf8
    username: root
    password: password
```

---

## 快速开发

### 1. 代码生成器

项目内置 `haitang-generator` 模块，支持根据数据库表结构自动生成：

- Controller 控制器
- Service/ServiceImpl 业务层
- Mapper/Mapper.xml 数据访问层
- Domain/BO/VO 领域对象

**使用步骤**：
1. 启动项目访问代码生成菜单
2. 导入数据库表
3. 编辑生成配置
4. 生成代码并下载

### 2. 新增业务模块示例

**Step 1: 创建实体类**

```java
package com.haitang.erp.domain;

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("erp_order")
public class ErpOrder extends TenantEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    @TableId(value = "id")
    private Long id;

    private String orderNo;
    private Long customerId;
    private BigDecimal totalAmount;
    private Integer status;
}
```

**Step 2: 创建Mapper接口**

```java
package com.haitang.erp.mapper;

@Mapper
public interface ErpOrderMapper extends BaseMapperPlus<ErpOrderMapper, ErpOrder, ErpOrderVo> {

}
```

**Step 3: 创建Service**

```java
package com.haitang.erp.service;

public interface IErpOrderService {
    List<ErpOrderVo> queryList(ErpOrderBo bo);
    ErpOrderVo queryById(Long id);
    Long insertByBo(ErpOrderBo bo);
    Boolean updateByBo(ErpOrderBo bo);
    Boolean deleteByIds(Collection<Long> ids);
}
```

```java
package com.haitang.erp.service.impl;

@Service
public class ErpOrderServiceImpl extends ServiceImpl<ErpOrderMapper, ErpOrder> implements IErpOrderService {

    @Override
    public List<ErpOrderVo> queryList(ErpOrderBo bo) {
        LambdaQueryWrapper<ErpOrder> lqw = Wrappers.lambdaQuery();
        lqw.like(StringUtils.isNotBlank(bo.getOrderNo()), ErpOrder::getOrderNo, bo.getOrderNo());
        return listVo(lqw, ErpOrderVo.class);
    }

    @Override
    public Long insertByBo(ErpOrderBo bo) {
        ErpOrder entity = MapstructUtils.convert(bo, ErpOrder.class);
        validEntityBeforeSave(entity);
        boolean flag = save(entity);
        if (flag) {
            bo.setId(entity.getId());
        }
        return entity.getId();
    }
}
```

**Step 4: 创建Controller**

```java
package com.haitang.erp.controller;

@RestController
@RequestMapping("/erp/order")
@RequiredArgsConstructor
public class ErpOrderController extends BaseController {

    private final IErpOrderService orderService;

    @GetMapping("/list")
    @RequiredPermissions("erp:order:list")
    public TableDataInfo<ErpOrderVo> list(ErpOrderBo bo, PageQuery pageQuery) {
        return orderService.queryPageList(bo, pageQuery);
    }

    @GetMapping("/{id}")
    @RequiredPermissions("erp:order:query")
    public R<ErpOrderVo> getInfo(@NotNull(message = "主键不能为空") @PathVariable Long id) {
        return R.ok(orderService.queryById(id));
    }

    @PostMapping()
    @RequiredPermissions("erp:order:add")
    @Log(title = "订单", businessType = BusinessType.INSERT)
    public R<Void> add(@Validated @RequestBody ErpOrderBo bo) {
        return R.ok(orderService.insertByBo(bo));
    }

    @PutMapping()
    @RequiredPermissions("erp:order:edit")
    @Log(title = "订单", businessType = BusinessType.UPDATE)
    public R<Void> edit(@Validated @RequestBody ErpOrderBo bo) {
        return R.ok(orderService.updateByBo(bo));
    }

    @DeleteMapping("/{ids}")
    @RequiredPermissions("erp:order:remove")
    @Log(title = "订单", businessType = BusinessType.DELETE)
    public R<Void> remove(@NotEmpty(message = "主键不能为空") @PathVariable Long[] ids) {
        return R.ok(orderService.deleteByIds(List.of(ids)));
    }
}
```

### 3. MyBatis Mapper XML

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
    "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.haitang.erp.mapper.ErpOrderMapper">

    <resultMap type="com.haitang.erp.domain.ErpOrder" id="ErpOrderResult">
        <id property="id" column="id"/>
        <result property="orderNo" column="order_no"/>
        <result property="customerId" column="customer_id"/>
        <result property="totalAmount" column="total_amount"/>
        <result property="status" column="status"/>
        <result property="createTime" column="create_time"/>
    </resultMap>

    <select id="selectOrderList" resultMap="ErpOrderResult">
        SELECT o.*, c.name as customer_name
        FROM erp_order o
        LEFT JOIN erp_customer c ON o.customer_id = c.id
        WHERE o.tenant_id = #{tenantId}
        <if test="orderNo != null and orderNo != ''">
            AND o.order_no LIKE CONCAT('%', #{orderNo}, '%')
        </if>
        ORDER BY o.create_time DESC
    </select>

</mapper>
```

---

## 部署说明

### 环境要求

| 组件 | 版本要求 |
|------|----------|
| JDK | 17+ |
| MySQL | 8.0+ |
| Redis | 6.0+ |
| Maven | 3.6+ |

### 本地开发启动

```bash
# 1. 导入数据库脚本
mysql -u root -p < sql/haitang_erp.sql

# 2. 修改配置文件
# 编辑 haitang-admin/src/main/resources/application-dev.yml
# 配置数据库和Redis连接信息

# 3. 启动项目
mvn spring-boot:run -pl haitang-admin -Dspring-boot.run.profiles=dev
```

### 生产环境打包

```bash
# 打包（使用prod环境）
mvn clean package -Pprod -DskipTests

# 启动
java -jar haitang-admin/target/haitang-admin.jar --spring.profiles.active=prod
```

### Docker部署

项目提供Dockerfile支持容器化部署：

```bash
# 构建镜像
docker build -t haitang-erp:latest .

# 运行容器
docker run -d \
  --name haitang-erp \
  -p 8080:8080 \
  -e SPRING_PROFILES_ACTIVE=prod \
  -e MYSQL_HOST=192.168.1.100 \
  -e MYSQL_PORT=3306 \
  -e REDIS_HOST=192.168.1.101 \
  haitang-erp:latest
```

### Docker Compose部署

```yaml
version: '3'
services:
  mysql:
    image: mysql:8.0
    environment:
      MYSQL_ROOT_PASSWORD: root123
      MYSQL_DATABASE: haitang_erp
    volumes:
      - ./sql:/docker-entrypoint-initdb.d
      - mysql_data:/var/lib/mysql

  redis:
    image: redis:6.0
    volumes:
      - redis_data:/data

  app:
    image: haitang-erp:latest
    depends_on:
      - mysql
      - redis
    ports:
      - "8080:8080"
    environment:
      SPRING_PROFILES_ACTIVE: prod
      MYSQL_HOST: mysql
      REDIS_HOST: redis

volumes:
  mysql_data:
  redis_data:
```

---

## 常见问题

### 1. 启动报错找不到Bean

检查是否正确配置了组件扫描路径，确保启动类位于根包下。

### 2. 多租户数据隔离问题

确保所有实体类都继承了 `TenantEntity`，MyBatis拦截器会自动添加租户条件。

### 3. 权限控制不生效

检查Controller方法是否添加了 `@RequiredPermissions` 注解，并确保用户已分配相应权限。

---

## 相关文档链接

- [RuoYi-Vue-Plus官方文档](https://plus-doc.dromara.org/)
- [MyBatis-Plus官方文档](https://baomidou.com/pages/24112f/)
- [Sa-Token官方文档](https://sa-token.cc/)
- [EasyExcel官方文档](https://easyexcel.opensource.alibaba.com/)
- [Spring Boot官方文档](https://spring.io/projects/spring-boot)

---

## 贡献指南

1. Fork 本仓库
2. 新建特性分支 (`git checkout -b feature/xxx`)
3. 提交代码 (`git commit -m 'Add some feature'`)
4. 推送到分支 (`git push origin feature/xxx`)
5. 新建 Pull Request

---

**版权所有 © 2024 旭旭吃不饱**
=============================================================
          
          
找到了配置信息，下面是 **Windows本地部署完整步骤**：

## 🚀 Windows本地部署指南

### 一、环境准备

| 软件 | 版本要求 | 下载地址 |
|------|----------|----------|
| JDK | 17+ | https://adoptium.net/ |
| MySQL | 8.0+ | https://dev.mysql.com/downloads/mysql/ |
| Redis | 6.0+ | https://github.com/tporadowski/redis/releases |
| Maven | 3.6+ | https://maven.apache.org/download.cgi |
| Node.js | 16+ (前端需要) | https://nodejs.org/ |

---

### 二、数据库配置

#### 1. 创建数据库

```sql
CREATE DATABASE `haitang-erp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
```

#### 2. 导入SQL脚本

SQL文件位置：
- `d:\erp\qixiu-erp\sql\haitang-erp.sql` - 主数据库
- `d:\erp\qixiu-erp\sql\powerjob.sql` - 任务调度（可选）

**方式一：命令行导入**
```bash
mysql -u root -p haitang-erp < d:\erp\qixiu-erp\sql\haitang-erp.sql
```

**方式二：Navicat/MySQL Workbench 导入**
- 打开工具连接MySQL
- 选择 `haitang-erp` 数据库
- 运行SQL文件

---

### 三、修改配置文件

编辑 `haitang-admin\src\main\resources\application-dev.yml`：

```yaml
spring:
  datasource:
    dynamic:
      datasource:
        master:
          url: jdbc:mysql://127.0.0.1:3306/haitang-erp?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8&autoReconnect=true&rewriteBatchedStatements=true&allowPublicKeyRetrieval=true
          username: root
          password: 你的MySQL密码    # 修改这里

spring.data:
  redis:
    host: 127.0.0.1
    port: 6379
    password:              # 如有密码则填写
```

---

### 四、启动服务

#### 1. 启动 Redis

```bash
# Windows下进入Redis目录
redis-server.exe redis.windows.conf
```

#### 2. 启动后端

**方式一：IDEA启动（推荐）**
1. 用IDEA打开项目
2. 找到 `haitang-admin\src\main\java\com\haitang\DromaraApplication.java`
3. 右键 → Run 'DromaraApplication'

**方式二：命令行启动**
```bash
cd d:\erp\qixiu-erp

# 编译项目
mvn clean install -DskipTests

# 启动服务
mvn spring-boot:run -pl haitang-admin -Dspring-boot.run.profiles=dev
```

启动成功后访问：http://localhost:8080

---

### 五、前端部署（如需）

项目前端是独立的Vue3项目，需要单独部署：

```bash
# 克隆前端项目（参考原RuoYi-Vue-Plus前端）
git clone https://gitee.com/dromara/RuoYi-Vue-Plus.git

# 安装依赖
npm install

# 启动开发服务
npm run dev
```

---

### 六、登录信息

| 账号 | 密码 |
|------|------|
| admin | 123456 |

---

### 七、常见问题

#### Q1: 端口被占用
修改 `application.yml` 中的端口：
```yaml
server:
  port: 8081  # 改为其他端口
```

#### Q2: Redis连接失败
确保Redis已启动，检查端口6379是否被占用

#### Q3: MySQL连接失败
检查MySQL服务是否启动，用户名密码是否正确

#### Q4: Maven下载依赖慢
配置阿里云镜像，编辑 `settings.xml`：
```xml
<mirror>
    <id>aliyun</id>
    <mirrorOf>central</mirrorOf>
    <url>https://maven.aliyun.com/repository/public</url>
</mirror>
```

---

需要我帮你执行某个步骤吗？比如修改配置文件或启动服务？

---

## 进销存数据库结构

### 表清单

| 表名 | 说明 |
|------|------|
| erp_customer | 客户信息表 |
| erp_supplier | 供应商信息表 |
| erp_warehouse | 仓库信息表 |
| erp_product | 产品信息表 |
| erp_product_category | 产品分类表 |
| erp_product_unit | 产品单位表 |
| erp_account | 结算账户表 |
| erp_sale_order | 销售订单表 |
| erp_sale_order_items | 销售订单明细表 |
| erp_sale_out | 销售出库表 |
| erp_sale_out_items | 销售出库明细表 |
| erp_sale_return | 销售退货表 |
| erp_sale_return_items | 销售退货明细表 |
| erp_purchase_order | 采购订单表 |
| erp_purchase_order_items | 采购订单明细表 |
| erp_purchase_in | 采购入库表 |
| erp_purchase_in_items | 采购入库明细表 |
| erp_purchase_return | 采购退货表 |
| erp_purchase_return_items | 采购退货明细表 |
| erp_stock | 库存表 |
| erp_stock_record | 库存记录表 |
| erp_stock_in | 入库单表 |
| erp_stock_in_item | 入库单明细表 |
| erp_stock_out | 出库单表 |
| erp_stock_out_item | 出库单明细表 |
| erp_stock_check | 盘点单表 |
| erp_stock_check_item | 盘点单明细表 |
| erp_stock_move | 调拨单表 |
| erp_stock_move_item | 调拨单明细表 |
| erp_finance_receipt_item | 收款单明细表 |
| erp_finance_payment | 付款单表 |
| erp_finance_payment_item | 付款单明细表 |

---

### 基础资料表

#### erp_customer 客户信息表

| 字段名 | 类型 | Nullable | 说明 |
|--------|------|----------|------|
| id | bigint(20) | NO | 主键ID |
| name | varchar(255) | NO | 客户名称 |
| contact | varchar(100) | YES | 联系人 |
| mobile | varchar(30) | YES | 手机号码 |
| telephone | varchar(30) | YES | 联系电话 |
| email | varchar(50) | YES | 电子邮箱 |
| fax | varchar(30) | YES | 传真 |
| remark | varchar(255) | YES | 备注 |
| status | tinyint(4) | NO | 状态（0正常 1停用） |
| sort | int(11) | NO | 排序 |
| tax_no | varchar(50) | YES | 纳税人识别号 |
| tax_percent | decimal(24,6) | YES | 税率 |
| bank_name | varchar(50) | YES | 开户行 |
| bank_account | varchar(50) | YES | 银行账号 |
| bank_address | varchar(50) | YES | 开户行地址 |
| create_dept | bigint(20) | YES | 创建部门 |
| create_time | datetime | YES | 创建时间 |
| create_by | bigint(20) | YES | 创建者 |
| update_time | datetime | YES | 更新时间 |
| update_by | bigint(20) | YES | 更新者 |
| tenant_id | varchar(20) | YES | 租户编号 |
| del_flag | int(11) | YES | 删除标志（0存在 1删除） |

#### erp_supplier 供应商信息表

| 字段名 | 类型 | Nullable | 说明 |
|--------|------|----------|------|
| id | bigint(20) | NO | 主键ID |
| name | varchar(255) | NO | 供应商名称 |
| contact | varchar(100) | YES | 联系人 |
| mobile | varchar(30) | YES | 手机号码 |
| telephone | varchar(30) | YES | 联系电话 |
| email | varchar(50) | YES | 电子邮箱 |
| fax | varchar(30) | YES | 传真 |
| remark | varchar(255) | YES | 备注 |
| status | tinyint(4) | NO | 状态（0正常 1停用） |
| sort | int(11) | NO | 排序 |
| tax_no | varchar(50) | YES | 纳税人识别号 |
| tax_percent | decimal(24,6) | YES | 税率 |
| bank_account | varchar(50) | YES | 银行账号 |
| bank_address | varchar(50) | YES | 开户行地址 |
| create_dept | bigint(20) | YES | 创建部门 |
| create_time | datetime | YES | 创建时间 |
| create_by | bigint(20) | YES | 创建者 |
| update_time | datetime | YES | 更新时间 |
| update_by | bigint(20) | YES | 更新者 |
| tenant_id | varchar(20) | YES | 租户编号 |
| del_flag | int(11) | YES | 删除标志（0存在 1删除） |

#### erp_warehouse 仓库信息表

| 字段名 | 类型 | Nullable | 说明 |
|--------|------|----------|------|
| id | bigint(20) | NO | 主键ID |
| name | varchar(20) | NO | 仓库名称 |
| address | varchar(50) | YES | 仓库地址 |
| sort | bigint(20) | NO | 排序 |
| remark | varchar(100) | YES | 备注 |
| principal | varchar(20) | YES | 负责人 |
| warehouse_price | decimal(24,6) | YES | 仓储费单价（元） |
| truckage_price | decimal(24,6) | YES | 运费单价（元） |
| status | tinyint(4) | NO | 状态（0正常 1停用） |
| default_status | tinyint(1) | YES | 是否默认 |
| create_dept | bigint(20) | YES | 创建部门 |
| create_time | datetime | YES | 创建时间 |
| create_by | bigint(20) | YES | 创建者 |
| update_time | datetime | YES | 更新时间 |
| update_by | bigint(20) | YES | 更新者 |
| tenant_id | varchar(20) | YES | 租户编号 |
| del_flag | int(11) | YES | 删除标志（0存在 1删除） |

#### erp_product 产品信息表

| 字段名 | 类型 | Nullable | 说明 |
|--------|------|----------|------|
| id | bigint(20) | NO | 主键ID |
| name | varchar(100) | NO | 产品名称 |
| bar_code | varchar(50) | NO | 产品条码 |
| category_id | bigint(20) | NO | 产品分类编号 |
| unit_id | bigint(20) | NO | 单位编号 |
| status | tinyint(4) | NO | 状态（0正常 1停用） |
| standard | varchar(100) | YES | 产品规格 |
| remark | varchar(500) | YES | 产品备注 |
| expiry_day | int(11) | YES | 保质期天数 |
| weight | decimal(24,6) | YES | 基础重量（kg） |
| purchase_price | decimal(24,6) | YES | 采购价格 |
| sale_price | decimal(24,6) | YES | 销售价格 |
| min_price | decimal(24,6) | YES | 最低售价 |
| create_dept | bigint(20) | YES | 创建部门 |
| create_time | datetime | YES | 创建时间 |
| create_by | bigint(20) | YES | 创建者 |
| update_time | datetime | YES | 更新时间 |
| update_by | bigint(20) | YES | 更新者 |
| tenant_id | varchar(20) | YES | 租户编号 |
| del_flag | int(11) | YES | 删除标志（0存在 1删除） |

#### erp_product_category 产品分类表

| 字段名 | 类型 | Nullable | 说明 |
|--------|------|----------|------|
| id | bigint(20) | NO | 主键ID |
| parent_id | bigint(20) | NO | 父级分类ID |
| name | varchar(255) | NO | 分类名称 |
| code | varchar(100) | NO | 分类编码 |
| sort | int(11) | YES | 排序 |
| status | tinyint(4) | NO | 状态（0正常 1停用） |
| create_dept | bigint(20) | YES | 创建部门 |
| create_time | datetime | YES | 创建时间 |
| create_by | bigint(20) | YES | 创建者 |
| update_time | datetime | YES | 更新时间 |
| tenant_id | varchar(20) | YES | 租户编号 |
| del_flag | int(11) | YES | 删除标志（0存在 1删除） |

#### erp_product_unit 产品单位表

| 字段名 | 类型 | Nullable | 说明 |
|--------|------|----------|------|
| id | bigint(20) | NO | 主键ID |
| name | varchar(50) | NO | 单位名称 |
| status | tinyint(4) | NO | 状态（0正常 1停用） |
| create_dept | bigint(20) | YES | 创建部门 |
| create_time | datetime | YES | 创建时间 |
| create_by | bigint(20) | YES | 创建者 |
| update_time | datetime | YES | 更新时间 |
| tenant_id | varchar(20) | YES | 租户编号 |
| del_flag | int(11) | YES | 删除标志（0存在 1删除） |

#### erp_account 结算账户表

| 字段名 | 类型 | Nullable | 说明 |
|--------|------|----------|------|
| id | bigint(20) | NO | 主键ID |
| name | varchar(255) | NO | 账户名称 |
| no | varchar(50) | YES | 账户编号 |
| remark | varchar(255) | YES | 备注 |
| status | tinyint(4) | NO | 状态（0正常 1停用） |
| sort | int(11) | NO | 排序 |
| default_status | bit(1) | YES | 是否默认 |
| create_dept | bigint(20) | YES | 创建部门 |
| create_time | datetime | YES | 创建时间 |
| create_by | bigint(20) | YES | 创建者 |
| update_time | datetime | YES | 更新时间 |
| update_by | bigint(20) | YES | 更新者 |
| tenant_id | varchar(20) | YES | 租户编号 |
| del_flag | int(11) | YES | 删除标志（0存在 1删除） |

---

### 销售管理表

#### erp_sale_order 销售订单表

| 字段名 | 类型 | Nullable | 说明 |
|--------|------|----------|------|
| id | bigint(20) | NO | 主键ID |
| no | varchar(255) | NO | 销售单号 |
| status | tinyint(4) | NO | 订单状态 |
| customer_id | bigint(20) | NO | 客户ID |
| account_id | bigint(20) | NO | 结算账户ID |
| order_time | datetime | NO | 订单时间 |
| total_count | decimal(24,6) | NO | 合计数量 |
| total_price | decimal(24,6) | NO | 合计金额 |
| total_product_price | decimal(24,6) | NO | 合计产品金额 |
| total_tax_price | decimal(24,6) | NO | 合计税额 |
| discount_percent | decimal(24,6) | NO | 折扣比例 |
| discount_price | decimal(24,6) | NO | 折扣金额 |
| deposit_price | decimal(24,6) | YES | 已收款金额 |
| file_url | varchar(512) | YES | 附件地址 |
| remark | varchar(1024) | YES | 备注 |
| out_count | decimal(24,6) | NO | 已出库数量 |
| return_count | decimal(24,6) | NO | 已退货数量 |
| create_dept | bigint(20) | YES | 创建部门 |
| create_time | datetime | YES | 创建时间 |
| create_by | bigint(20) | YES | 创建者 |
| update_time | datetime | YES | 更新时间 |
| update_by | bigint(20) | YES | 更新者 |
| tenant_id | varchar(20) | YES | 租户编号 |
| del_flag | int(11) | YES | 删除标志（0存在 1删除） |

#### erp_sale_order_items 销售订单明细表

| 字段名 | 类型 | Nullable | 说明 |
|--------|------|----------|------|
| id | bigint(20) | NO | 主键ID |
| order_id | bigint(20) | NO | 订单ID |
| product_id | bigint(20) | NO | 产品ID |
| product_unit_id | bigint(20) | NO | 产品单位ID |
| product_price | decimal(24,6) | NO | 产品单价 |
| count | decimal(24,6) | NO | 数量 |
| total_price | decimal(24,6) | NO | 金额 |
| tax_percent | decimal(24,6) | YES | 税率 |
| tax_price | decimal(24,6) | YES | 税额 |
| remark | varchar(1024) | YES | 备注 |
| out_count | decimal(24,6) | NO | 已出库数量 |
| return_count | decimal(24,6) | NO | 已退货数量 |
| create_dept | bigint(20) | YES | 创建部门 |
| create_time | datetime | YES | 创建时间 |
| create_by | bigint(20) | YES | 创建者 |
| update_time | datetime | YES | 更新时间 |
| tenant_id | varchar(20) | YES | 租户编号 |
| del_flag | int(11) | YES | 删除标志（0存在 1删除） |

#### erp_sale_out 销售出库表

| 字段名 | 类型 | Nullable | 说明 |
|--------|------|----------|------|
| id | bigint(20) | NO | 主键ID |
| no | varchar(255) | NO | 出库单号 |
| status | tinyint(4) | NO | 状态 |
| customer_id | bigint(20) | NO | 客户ID |
| account_id | bigint(20) | NO | 结算账户ID |
| sale_user_id | bigint(20) | YES | 销售人员ID |
| out_time | datetime | NO | 出库时间 |
| order_id | bigint(20) | NO | 订单ID |
| order_no | varchar(255) | NO | 订单编号 |
| total_count | decimal(24,6) | NO | 合计数量 |
| total_price | decimal(24,6) | NO | 合计金额 |
| discount_percent | decimal(24,6) | NO | 折扣比例 |
| discount_price | decimal(24,6) | NO | 优惠金额 |
| other_price | decimal(24,6) | NO | 其他费用 |
| file_url | varchar(512) | YES | 附件地址 |
| remark | varchar(1024) | YES | 备注 |
| create_dept | bigint(20) | YES | 创建部门 |
| create_time | datetime | YES | 创建时间 |
| create_by | bigint(20) | YES | 创建者 |
| update_time | datetime | YES | 更新时间 |
| update_by | bigint(20) | YES | 更新者 |
| tenant_id | varchar(20) | YES | 租户编号 |
| del_flag | int(11) | YES | 删除标志（0存在 1删除） |

#### erp_sale_out_items 销售出库明细表

| 字段名 | 类型 | Nullable | 说明 |
|--------|------|----------|------|
| id | bigint(20) | NO | 主键ID |
| out_id | bigint(20) | NO | 出库单ID |
| order_item_id | bigint(20) | NO | 订单明细ID |
| warehouse_id | bigint(20) | NO | 仓库ID |
| product_id | bigint(20) | NO | 产品ID |
| product_unit_id | bigint(20) | NO | 产品单位ID |
| product_price | decimal(24,6) | NO | 产品单价 |
| count | decimal(24,6) | NO | 数量 |
| total_price | decimal(24,6) | NO | 金额 |
| tax_percent | decimal(24,6) | YES | 税率 |
| tax_price | decimal(24,6) | YES | 税额 |
| remark | varchar(1024) | YES | 备注 |
| create_dept | bigint(20) | YES | 创建部门 |
| create_time | datetime | YES | 创建时间 |
| create_by | bigint(20) | YES | 创建者 |
| update_time | datetime | YES | 更新时间 |
| tenant_id | varchar(20) | YES | 租户编号 |
| del_flag | int(11) | YES | 删除标志（0存在 1删除） |

#### erp_sale_return 销售退货表

| 字段名 | 类型 | Nullable | 说明 |
|--------|------|----------|------|
| id | bigint(20) | NO | 主键ID |
| no | varchar(255) | NO | 退货单号 |
| status | tinyint(4) | NO | 状态 |
| customer_id | bigint(20) | NO | 客户ID |
| account_id | bigint(20) | NO | 结算账户ID |
| sale_user_id | bigint(20) | YES | 销售人员ID |
| return_time | datetime | NO | 退货时间 |
| order_id | bigint(20) | NO | 原订单ID |
| order_no | varchar(255) | NO | 原订单编号 |
| total_count | decimal(24,6) | NO | 合计数量 |
| total_price | decimal(24,6) | NO | 合计金额 |
| refund_price | decimal(24,6) | NO | 已退款金额 |
| total_product_price | decimal(24,6) | NO | 合计产品金额 |
| total_tax_price | decimal(24,6) | NO | 合计税额 |
| discount_percent | decimal(24,6) | NO | 折扣比例 |
| discount_price | decimal(24,6) | NO | 优惠金额 |
| other_price | decimal(24,6) | NO | 其他费用 |
| file_url | varchar(512) | YES | 附件地址 |
| remark | varchar(1024) | YES | 备注 |
| create_dept | bigint(20) | YES | 创建部门 |
| create_time | datetime | YES | 创建时间 |
| create_by | bigint(20) | YES | 创建者 |
| update_time | datetime | YES | 更新时间 |
| update_by | bigint(20) | YES | 更新者 |
| tenant_id | varchar(20) | YES | 租户编号 |
| del_flag | int(11) | YES | 删除标志（0存在 1删除） |

#### erp_sale_return_items 销售退货明细表

| 字段名 | 类型 | Nullable | 说明 |
|--------|------|----------|------|
| id | bigint(20) | NO | 主键ID |
| return_id | bigint(20) | NO | 退货单ID |
| order_item_id | bigint(20) | NO | 订单明细ID |
| warehouse_id | bigint(20) | NO | 仓库ID |
| product_id | bigint(20) | NO | 产品ID |
| product_unit_id | bigint(20) | NO | 产品单位ID |
| product_price | decimal(24,6) | NO | 产品单价 |
| count | decimal(24,6) | NO | 数量 |
| total_price | decimal(24,6) | NO | 金额 |
| tax_percent | decimal(24,6) | YES | 税率 |
| tax_price | decimal(24,6) | YES | 税额 |
| remark | varchar(1024) | YES | 备注 |
| create_dept | bigint(20) | YES | 创建部门 |
| create_time | datetime | YES | 创建时间 |
| create_by | bigint(20) | YES | 创建者 |
| update_time | datetime | YES | 更新时间 |
| tenant_id | varchar(20) | YES | 租户编号 |
| del_flag | int(11) | YES | 删除标志（0存在 1删除） |

---

### 采购管理表

#### erp_purchase_order 采购订单表

| 字段名 | 类型 | Nullable | 说明 |
|--------|------|----------|------|
| id | bigint(20) | NO | 主键ID |
| no | varchar(255) | NO | 采购单号 |
| status | tinyint(4) | NO | 订单状态 |
| supplier_id | bigint(20) | NO | 供应商ID |
| account_id | bigint(20) | NO | 结算账户ID |
| order_time | datetime | NO | 订单时间 |
| total_count | decimal(24,6) | NO | 合计数量 |
| total_price | decimal(24,6) | NO | 合计金额 |
| total_product_price | decimal(24,6) | NO | 合计产品金额 |
| total_tax_price | decimal(24,6) | NO | 合计税额 |
| discount_percent | decimal(24,6) | NO | 折扣比例 |
| discount_price | decimal(24,6) | NO | 折扣金额 |
| deposit_price | decimal(24,6) | YES | 已付款金额 |
| file_url | varchar(512) | YES | 附件地址 |
| remark | varchar(1024) | YES | 备注 |
| in_count | decimal(24,6) | NO | 已入库数量 |
| return_count | decimal(24,6) | NO | 已退货数量 |
| create_dept | bigint(20) | YES | 创建部门 |
| create_time | datetime | YES | 创建时间 |
| create_by | bigint(20) | YES | 创建者 |
| update_time | datetime | YES | 更新时间 |
| update_by | bigint(20) | YES | 更新者 |
| tenant_id | varchar(20) | YES | 租户编号 |
| del_flag | int(11) | YES | 删除标志（0存在 1删除） |

#### erp_purchase_order_items 采购订单明细表

| 字段名 | 类型 | Nullable | 说明 |
|--------|------|----------|------|
| id | bigint(20) | NO | 主键ID |
| order_id | bigint(20) | NO | 订单ID |
| product_id | bigint(20) | NO | 产品ID |
| product_unit_id | bigint(20) | NO | 产品单位ID |
| product_price | decimal(24,6) | NO | 产品单价 |
| count | decimal(24,6) | NO | 数量 |
| total_price | decimal(24,6) | NO | 金额 |
| tax_percent | decimal(24,6) | YES | 税率 |
| tax_price | decimal(24,6) | YES | 税额 |
| remark | varchar(1024) | YES | 备注 |
| in_count | decimal(24,6) | NO | 已入库数量 |
| return_count | decimal(24,6) | NO | 已退货数量 |
| create_dept | bigint(20) | YES | 创建部门 |
| create_time | datetime | YES | 创建时间 |
| create_by | bigint(20) | YES | 创建者 |
| update_time | datetime | YES | 更新时间 |
| tenant_id | varchar(20) | YES | 租户编号 |
| del_flag | int(11) | YES | 删除标志（0存在 1删除） |

#### erp_purchase_in 采购入库表

| 字段名 | 类型 | Nullable | 说明 |
|--------|------|----------|------|
| id | bigint(20) | NO | 主键ID |
| no | varchar(255) | NO | 入库单号 |
| status | tinyint(4) | NO | 状态 |
| supplier_id | bigint(20) | NO | 供应商ID |
| account_id | bigint(20) | NO | 结算账户ID |
| in_time | datetime | NO | 入库时间 |
| order_id | bigint(20) | NO | 订单ID |
| order_no | varchar(255) | NO | 订单编号 |
| total_count | decimal(24,6) | NO | 合计数量 |
| total_price | decimal(24,6) | NO | 合计金额 |
| payment_price | decimal(24,6) | NO | 已付款金额 |
| total_product_price | decimal(24,6) | NO | 合计产品金额 |
| total_tax_price | decimal(24,6) | NO | 合计税额 |
| discount_percent | decimal(24,6) | NO | 折扣比例 |
| discount_price | decimal(24,6) | NO | 优惠金额 |
| other_price | decimal(24,6) | NO | 其他费用 |
| remark | varchar(1024) | YES | 备注 |
| create_dept | bigint(20) | YES | 创建部门 |
| create_time | datetime | YES | 创建时间 |
| create_by | bigint(20) | YES | 创建者 |
| update_time | datetime | YES | 更新时间 |
| update_by | bigint(20) | YES | 更新者 |
| tenant_id | varchar(20) | YES | 租户编号 |
| del_flag | int(11) | YES | 删除标志（0存在 1删除） |

#### erp_purchase_in_items 采购入库明细表

| 字段名 | 类型 | Nullable | 说明 |
|--------|------|----------|------|
| id | bigint(20) | NO | 主键ID |
| in_id | bigint(20) | NO | 入库单ID |
| order_item_id | bigint(20) | NO | 订单明细ID |
| warehouse_id | bigint(20) | NO | 仓库ID |
| product_id | bigint(20) | NO | 产品ID |
| product_unit_id | bigint(20) | NO | 产品单位ID |
| product_price | decimal(24,6) | NO | 产品单价 |
| count | decimal(24,6) | NO | 数量 |
| total_price | decimal(24,6) | NO | 金额 |
| tax_percent | decimal(24,6) | YES | 税率 |
| tax_price | decimal(24,6) | YES | 税额 |
| remark | varchar(1024) | YES | 备注 |
| create_dept | bigint(20) | YES | 创建部门 |
| create_time | datetime | YES | 创建时间 |
| create_by | bigint(20) | YES | 创建者 |
| update_time | datetime | YES | 更新时间 |
| tenant_id | varchar(20) | YES | 租户编号 |
| del_flag | int(11) | YES | 删除标志（0存在 1删除） |

#### erp_purchase_return 采购退货表

| 字段名 | 类型 | Nullable | 说明 |
|--------|------|----------|------|
| id | bigint(20) | NO | 主键ID |
| no | varchar(255) | NO | 退货单号 |
| status | tinyint(4) | NO | 状态 |
| supplier_id | bigint(20) | NO | 供应商ID |
| account_id | bigint(20) | NO | 结算账户ID |
| return_time | datetime | NO | 退货时间 |
| order_id | bigint(20) | NO | 原订单ID |
| order_no | varchar(255) | NO | 原订单编号 |
| total_count | decimal(24,6) | NO | 合计数量 |
| total_price | decimal(24,6) | NO | 合计金额 |
| refund_price | decimal(24,6) | NO | 已退款金额 |
| total_product_price | decimal(24,6) | NO | 合计产品金额 |
| total_tax_price | decimal(24,6) | NO | 合计税额 |
| discount_percent | decimal(24,6) | NO | 折扣比例 |
| discount_price | decimal(24,6) | NO | 优惠金额 |
| other_price | decimal(24,6) | NO | 其他费用 |
| file_url | varchar(512) | YES | 附件地址 |
| remark | varchar(1024) | YES | 备注 |
| create_dept | bigint(20) | YES | 创建部门 |
| create_time | datetime | YES | 创建时间 |
| create_by | bigint(20) | YES | 创建者 |
| update_time | datetime | YES | 更新时间 |
| update_by | bigint(20) | YES | 更新者 |
| tenant_id | varchar(20) | YES | 租户编号 |
| del_flag | int(11) | YES | 删除标志（0存在 1删除） |

#### erp_purchase_return_items 采购退货明细表

| 字段名 | 类型 | Nullable | 说明 |
|--------|------|----------|------|
| id | bigint(20) | NO | 主键ID |
| return_id | bigint(20) | NO | 退货单ID |
| order_item_id | bigint(20) | NO | 订单明细ID |
| warehouse_id | bigint(20) | NO | 仓库ID |
| product_id | bigint(20) | NO | 产品ID |
| product_unit_id | bigint(20) | NO | 产品单位ID |
| product_price | decimal(24,6) | NO | 产品单价 |
| count | decimal(24,6) | NO | 数量 |
| total_price | decimal(24,6) | NO | 金额 |
| tax_percent | decimal(24,6) | YES | 税率 |
| tax_price | decimal(24,6) | YES | 税额 |
| remark | varchar(1024) | YES | 备注 |
| create_dept | bigint(20) | YES | 创建部门 |
| create_time | datetime | YES | 创建时间 |
| create_by | bigint(20) | YES | 创建者 |
| update_time | datetime | YES | 更新时间 |
| tenant_id | varchar(20) | YES | 租户编号 |
| del_flag | int(11) | YES | 删除标志（0存在 1删除） |

---

### 库存管理表

#### erp_stock 库存表

| 字段名 | 类型 | Nullable | 说明 |
|--------|------|----------|------|
| id | bigint(20) | NO | 主键ID |
| product_id | bigint(20) | NO | 产品ID |
| warehouse_id | bigint(20) | NO | 仓库ID |
| count | decimal(24,6) | NO | 库存数量 |
| create_dept | bigint(20) | YES | 创建部门 |
| create_time | datetime | YES | 创建时间 |
| create_by | bigint(20) | YES | 创建者 |
| update_time | datetime | YES | 更新时间 |
| update_by | bigint(20) | YES | 更新者 |
| tenant_id | varchar(20) | YES | 租户编号 |
| del_flag | int(11) | YES | 删除标志（0存在 1删除） |

#### erp_stock_record 库存记录表

| 字段名 | 类型 | Nullable | 说明 |
|--------|------|----------|------|
| id | bigint(20) | NO | 主键ID |
| product_id | bigint(20) | NO | 产品ID |
| warehouse_id | bigint(20) | NO | 仓库ID |
| count | decimal(24,6) | NO | 出入数量 |
| total_count | decimal(24,6) | NO | 当前库存 |
| biz_type | tinyint(4) | NO | 业务类型 |
| biz_id | bigint(20) | NO | 业务ID |
| biz_item_id | bigint(20) | NO | 业务明细ID |
| biz_no | varchar(255) | NO | 业务单号 |
| create_dept | bigint(20) | YES | 创建部门 |
| create_time | datetime | YES | 创建时间 |
| create_by | bigint(20) | YES | 创建者 |
| update_time | datetime | YES | 更新时间 |
| update_by | bigint(20) | YES | 更新者 |
| tenant_id | varchar(20) | YES | 租户编号 |
| del_flag | int(11) | YES | 删除标志（0存在 1删除） |

#### erp_stock_in 入库单表

| 字段名 | 类型 | Nullable | 说明 |
|--------|------|----------|------|
| id | bigint(20) | NO | 主键ID |
| no | varchar(255) | NO | 入库单号 |
| in_time | datetime | NO | 入库时间 |
| supplier_id | bigint(20) | YES | 供应商ID |
| total_count | decimal(24,6) | NO | 合计数量 |
| total_price | decimal(24,6) | NO | 合计金额 |
| status | tinyint(4) | NO | 状态 |
| remark | varchar(255) | YES | 备注 |
| file_url | varchar(255) | YES | 附件地址 |
| create_dept | bigint(20) | YES | 创建部门 |
| create_time | datetime | YES | 创建时间 |
| create_by | bigint(20) | YES | 创建者 |
| update_time | datetime | YES | 更新时间 |
| update_by | bigint(20) | YES | 更新者 |
| tenant_id | varchar(20) | YES | 租户编号 |
| del_flag | int(11) | YES | 删除标志（0存在 1删除） |

#### erp_stock_in_item 入库单明细表

| 字段名 | 类型 | Nullable | 说明 |
|--------|------|----------|------|
| id | bigint(20) | NO | 主键ID |
| in_id | bigint(20) | NO | 入库单ID |
| warehouse_id | bigint(20) | NO | 仓库ID |
| product_id | bigint(20) | NO | 产品ID |
| product_unit_id | bigint(20) | NO | 产品单位ID |
| product_price | decimal(24,6) | YES | 产品单价 |
| count | decimal(24,6) | NO | 数量 |
| total_price | decimal(24,6) | YES | 金额 |
| remark | varchar(255) | YES | 备注 |
| create_dept | bigint(20) | YES | 创建部门 |
| create_time | datetime | YES | 创建时间 |
| create_by | bigint(20) | YES | 创建者 |
| update_time | datetime | YES | 更新时间 |
| tenant_id | varchar(20) | YES | 租户编号 |
| del_flag | int(11) | YES | 删除标志（0存在 1删除） |

#### erp_stock_out 出库单表

| 字段名 | 类型 | Nullable | 说明 |
|--------|------|----------|------|
| id | bigint(20) | NO | 主键ID |
| no | varchar(255) | NO | 出库单号 |
| customer_id | bigint(20) | YES | 客户ID |
| out_time | datetime | NO | 出库时间 |
| total_count | decimal(24,6) | NO | 合计数量 |
| total_price | decimal(24,6) | NO | 合计金额 |
| status | tinyint(4) | NO | 状态 |
| remark | varchar(255) | YES | 备注 |
| file_url | varchar(255) | YES | 附件地址 |
| create_dept | bigint(20) | YES | 创建部门 |
| create_time | datetime | YES | 创建时间 |
| create_by | bigint(20) | YES | 创建者 |
| update_time | datetime | YES | 更新时间 |
| update_by | bigint(20) | YES | 更新者 |
| tenant_id | varchar(20) | YES | 租户编号 |
| del_flag | int(11) | YES | 删除标志（0存在 1删除） |

#### erp_stock_out_item 出库单明细表

| 字段名 | 类型 | Nullable | 说明 |
|--------|------|----------|------|
| id | bigint(20) | NO | 主键ID |
| out_id | bigint(20) | NO | 出库单ID |
| warehouse_id | bigint(20) | NO | 仓库ID |
| product_id | bigint(20) | NO | 产品ID |
| product_unit_id | bigint(20) | NO | 产品单位ID |
| product_price | decimal(24,6) | YES | 产品单价 |
| count | decimal(24,6) | NO | 数量 |
| total_price | decimal(24,6) | YES | 金额 |
| remark | varchar(255) | YES | 备注 |
| create_dept | bigint(20) | YES | 创建部门 |
| create_time | datetime | YES | 创建时间 |
| create_by | bigint(20) | YES | 创建者 |
| update_time | datetime | YES | 更新时间 |
| tenant_id | varchar(20) | YES | 租户编号 |
| del_flag | int(11) | YES | 删除标志（0存在 1删除） |

#### erp_stock_check 盘点单表

| 字段名 | 类型 | Nullable | 说明 |
|--------|------|----------|------|
| id | bigint(20) | NO | 主键ID |
| no | varchar(255) | NO | 盘点单号 |
| check_time | datetime | NO | 盘点时间 |
| total_count | decimal(24,6) | NO | 合计数量 |
| total_price | decimal(24,6) | NO | 合计金额 |
| remark | varchar(255) | YES | 备注 |
| file_url | varchar(255) | YES | 附件地址 |
| create_dept | bigint(20) | YES | 创建部门 |
| create_time | datetime | YES | 创建时间 |
| create_by | bigint(20) | YES | 创建者 |
| update_time | datetime | YES | 更新时间 |
| update_by | bigint(20) | YES | 更新者 |
| tenant_id | varchar(20) | YES | 租户编号 |
| del_flag | int(11) | YES | 删除标志（0存在 1删除） |

#### erp_stock_check_item 盘点单明细表

| 字段名 | 类型 | Nullable | 说明 |
|--------|------|----------|------|
| id | bigint(20) | NO | 主键ID |
| check_id | bigint(20) | NO | 盘点单ID |
| warehouse_id | bigint(20) | NO | 仓库ID |
| product_id | bigint(20) | NO | 产品ID |
| product_unit_id | bigint(20) | NO | 产品单位ID |
| product_price | decimal(24,6) | YES | 产品单价 |
| stock_count | decimal(24,6) | NO | 账面数量 |
| actual_count | decimal(24,6) | NO | 实际数量 |
| count | decimal(24,6) | NO | 差异数量 |
| total_price | decimal(24,6) | YES | 差异金额 |
| remark | varchar(255) | YES | 备注 |
| create_dept | bigint(20) | YES | 创建部门 |
| create_time | datetime | YES | 创建时间 |
| create_by | bigint(20) | YES | 创建者 |
| update_time | datetime | YES | 更新时间 |
| tenant_id | varchar(20) | YES | 租户编号 |
| del_flag | int(11) | YES | 删除标志（0存在 1删除） |

#### erp_stock_move 调拨单表

| 字段名 | 类型 | Nullable | 说明 |
|--------|------|----------|------|
| id | bigint(20) | NO | 主键ID |
| no | varchar(255) | NO | 调拨单号 |
| move_time | datetime | NO | 调拨时间 |
| total_count | decimal(24,6) | NO | 合计数量 |
| total_price | decimal(24,6) | NO | 合计金额 |
| status | tinyint(4) | NO | 状态 |
| remark | varchar(255) | YES | 备注 |
| file_url | varchar(255) | YES | 附件地址 |
| create_dept | bigint(20) | YES | 创建部门 |
| create_time | datetime | YES | 创建时间 |
| create_by | bigint(20) | YES | 创建者 |
| update_time | datetime | YES | 更新时间 |
| update_by | bigint(20) | YES | 更新者 |
| tenant_id | varchar(20) | YES | 租户编号 |
| del_flag | int(11) | YES | 删除标志（0存在 1删除） |

#### erp_stock_move_item 调拨单明细表

| 字段名 | 类型 | Nullable | 说明 |
|--------|------|----------|------|
| id | bigint(20) | NO | 主键ID |
| move_id | bigint(20) | NO | 调拨单ID |
| source_warehouse_id | bigint(20) | NO | 源仓库ID |
| target_warehouse_id | bigint(20) | NO | 目标仓库ID |
| product_id | bigint(20) | NO | 产品ID |
| product_unit_id | bigint(20) | NO | 产品单位ID |
| product_price | decimal(24,6) | YES | 产品单价 |
| count | decimal(24,6) | NO | 调拨数量 |
| total_price | decimal(24,6) | YES | 金额 |
| remark | varchar(255) | YES | 备注 |
| create_dept | bigint(20) | YES | 创建部门 |
| create_time | datetime | YES | 创建时间 |
| create_by | bigint(20) | YES | 创建者 |
| update_time | datetime | YES | 更新时间 |
| tenant_id | varchar(20) | YES | 租户编号 |
| del_flag | int(11) | YES | 删除标志（0存在 1删除） |

---

### 财务管理表

#### erp_finance_receipt_item 收款单明细表

| 字段名 | 类型 | Nullable | 说明 |
|--------|------|----------|------|
| id | bigint(20) | NO | 主键ID |
| receipt_id | bigint(20) | NO | 收款单ID |
| biz_type | tinyint(4) | NO | 业务类型 |
| biz_id | bigint(20) | NO | 业务ID |
| biz_no | varchar(255) | NO | 业务单号 |
| total_price | decimal(24,6) | NO | 应收金额 |
| receipted_price | decimal(24,6) | NO | 已收金额 |
| receipt_price | decimal(24,6) | NO | 本次收款 |
| remark | varchar(1024) | YES | 备注 |
| create_dept | bigint(20) | YES | 创建部门 |
| create_time | datetime | YES | 创建时间 |
| create_by | bigint(20) | YES | 创建者 |
| update_time | datetime | YES | 更新时间 |
| update_by | bigint(20) | YES | 更新者 |
| tenant_id | varchar(20) | YES | 租户编号 |
| del_flag | int(11) | YES | 删除标志（0存在 1删除） |

#### erp_finance_payment 付款单表

| 字段名 | 类型 | Nullable | 说明 |
|--------|------|----------|------|
| id | bigint(20) | NO | 主键ID |
| no | varchar(255) | NO | 付款单号 |
| status | tinyint(4) | NO | 状态 |
| payment_time | datetime | NO | 付款时间 |
| finance_user_id | bigint(20) | YES | 财务人员ID |
| supplier_id | bigint(20) | NO | 供应商ID |
| account_id | bigint(20) | NO | 结算账户ID |
| total_price | decimal(24,6) | NO | 应付金额 |
| discount_price | decimal(24,6) | NO | 优惠金额 |
| payment_price | decimal(24,6) | NO | 本次付款 |
| remark | varchar(1024) | YES | 备注 |
| create_dept | bigint(20) | YES | 创建部门 |
| create_time | datetime | YES | 创建时间 |
| create_by | bigint(20) | YES | 创建者 |
| update_time | datetime | YES | 更新时间 |
| update_by | bigint(20) | YES | 更新者 |
| tenant_id | varchar(20) | YES | 租户编号 |
| del_flag | int(11) | YES | 删除标志（0存在 1删除） |

#### erp_finance_payment_item 付款单明细表

| 字段名 | 类型 | Nullable | 说明 |
|--------|------|----------|------|
| id | bigint(20) | NO | 主键ID |
| payment_id | bigint(20) | NO | 付款单ID |
| biz_type | tinyint(4) | NO | 业务类型 |
| biz_id | bigint(20) | NO | 业务ID |
| biz_no | varchar(255) | NO | 业务单号 |
| total_price | decimal(24,6) | NO | 应付金额 |
| paid_price | decimal(24,6) | NO | 已付金额 |
| payment_price | decimal(24,6) | NO | 本次付款 |
| remark | varchar(1024) | YES | 备注 |
| create_dept | bigint(20) | YES | 创建部门 |
| create_time | datetime | YES | 创建时间 |
| create_by | bigint(20) | YES | 创建者 |
| update_time | datetime | YES | 更新时间 |
| update_by | bigint(20) | YES | 更新者 |
| tenant_id | varchar(20) | YES | 租户编号 |
| del_flag | int(11) | YES | 删除标志（0存在 1删除） |
