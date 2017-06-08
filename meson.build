project('gobjgen', 'd')

executable(
    'gobjgen',
    ['src/main.d',
     'src/utils.d',
     'src/gobjclass.d',
     'src/property.d',
    ],
    d_args: [
        '-unittest',
        '-J../src/',
        '-I../src/'
    ],
    install: true
)

