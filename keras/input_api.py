import pandas as pd
from sklearn.preprocessing import MinMaxScaler

scaler = MinMaxScaler(feature_range=(0, 1))


def read(name, shouldFit=False):
    df = pd.read_csv(name)
    transform = scaler.fit_transform(df) if shouldFit else scaler.transform(df)
    return (pd.DataFrame(transform, columns=df.columns.values), scaler.scale_[8], scaler.min_[8])