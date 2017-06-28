# Rails and JWT authentication example 

## Initial setup

1. `.ruby-version` and `.ruby-gemset` files are present in the project for a easier start with `RVM`. 
    Once RVM is installed it should be as easier as:
    
    ```
      $ gem install bundler
      $ bundle install
    ```

## Dependencies

### PostgreSQL 9.4+

1. `postgresql-contrib-9.[...]` package is required to be installed in the DB server as it includes the `pgcrypto` function used to auto generate the `UUID` for every record stored.

    **Links**
  
    - [http://guides.rubyonrails.org/active_record_postgresql.html#uuid-primary-keys](http://guides.rubyonrails.org/active_record_postgresql.html#uuid-primary-keys)
    - [https://www.postgresql.org/docs/9.5/static/contrib.html](https://www.postgresql.org/docs/9.5/static/contrib.html)

### Production ENV Variables

| Variable                    | Use               |
| --------------------------: | ----------------- | 
| EXTERNAL_HOST               | Serializers       |
| EXTERNAL_HOST_PROTOCOL      | Serializers       |
| JWT_SECRET_KEY              | JWT Generation    |
| RAILS_ENV                   | Puma              |
| RDS_DB_NAME                 | DB name           |
| RDS_HOSTNAME                | DB server         |
| RDS_PASSWORD                | DB password       |
| RDS_PORT                    | DB port           |
| RDS_USERNAME                | DB username       |
| SECRET_KEY_BASE             | Rails             |

