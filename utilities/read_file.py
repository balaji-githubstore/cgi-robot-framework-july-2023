import pandas


def get_data_from_excel(file,sheet_name):
    df = pandas.read_excel(file,sheet_name)
    return df.values.tolist()