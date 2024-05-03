
from dotenv import dotenv_values

def get_sql_config():
    '''
        Function loads credentials from .env file and
        returns a dictionary containing the data needed for sqlalchemy.create_engine()
    '''
    needed_keys = ['host', 'port', 'database','user','password']
    dotenv_dict = dotenv_values(".env")
    sql_config = {key:dotenv_dict[key] for key in needed_keys if key in dotenv_dict}
    return sql_config

import pandas as pd
import sqlalchemy 

def get_data(sql_query):
    ''' 
    Connect to the PostgreSQL database server, run query and return data
    '''
    sql_config = get_sql_config()
    engine = sqlalchemy.create_engine('postgresql://user:pass@host/database',
                        connect_args=sql_config 
                        )
    with engine.begin() as conn: 
        results = conn.execute(sql_query)
        return results.fetchall()

def get_dataframe(sql_query):
    ''' 
    Connect to the PostgreSQL database server, 
    run query and return data as a pandas dataframe
    '''    
    sql_config = get_sql_config()
    engine = sqlalchemy.create_engine('postgresql://user:pass@host/database',
                        connect_args=sql_config 
                        )
    results = pd.read_sql_query(sql=sql_query, con=engine)
    return results

def get_engine():
    sql_config = get_sql_config()
    engine = sqlalchemy.create_engine('postgresql://user:pass@host/database',
                        connect_args=sql_config
                        )
    return engine