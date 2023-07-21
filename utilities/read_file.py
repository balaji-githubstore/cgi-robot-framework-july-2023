import pandas


def get_data_from_excel(file, sheet_name):
    df = pandas.read_excel(file, sheet_name)
    return df.values.tolist()


def get_data_from_csv(file):
    df = pandas.read_csv(filepath_or_buffer=file, delimiter=";")
    return df.values.tolist()
