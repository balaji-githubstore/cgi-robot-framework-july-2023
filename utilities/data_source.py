from utilities import read_file


class DataSource:
    valid_login_data = [
        ["physician", "physician", "English (Indian)", "OpenEMR"],
        ["accountant", "accountant", "English (Indian)", "OpenEMR"],
        ["receptionist", "receptionist", "English (Indian)", "OpenEMR"]
    ]

    # valid_login_data_excel = read_file.get_data_from_excel("../test_data/OpenEMRData.xlsx",
    #                                                        "test_valid_login")
    invalid_login_data = [
        ["bala", "john123", "Dutch", "Invalid username or password"],
        ["dina", "john123", "Dutch", "Invalid username or password"]
    ]

    # invalid_login_data_excel=read_file.get_data_from_excel("../test_data/OpenEMRData.xlsx",
    #                                                        "test_invalid_login")
    #
    # valid_login_data_csv=read_file.get_data_from_csv("../test_data/verify_valid_login_data.csv")