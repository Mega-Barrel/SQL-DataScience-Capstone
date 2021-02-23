
import pandas as pd
import sqlalchemy


# Creating connecting object

engine = sqlalchemy.create_engine('mysql+pymysql://saurabh:saurabh_sql@localhost:3306/UC_Davis')


# Reading the CSV files

print('Reading noc_regions CSV file')
regions = pd.read_csv('Dataset/noc_regions.csv')


print('Reading athlete_events CSV file')
events = pd.read_csv('Dataset/athlete_events.csv')


'''
Using inbuild pandas function to convert CSV to MySQL
'''

events.to_sql(
    'athlete_events',
    con = engine,
    index = False,
    if_exists = 'append'
)
print('Finished storing CSV file to MySQL database!')


regions.to_sql(
    'country',
    con = engine,
    index = False,
    if_exists = 'append'
)
print('Finished storing CSV file to MySQL database!')