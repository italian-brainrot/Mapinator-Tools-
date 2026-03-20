import os as sus,shutil as sustil
from zipfile import ZipFile as SusFile
from tempfile import TemporaryDirectory as SusDir
def susy():
    try:
        for susy in sus.listdir():
            if sus.path.isfile(susy):
                if susy.endswith('.osz'):
                    with SusFile(susy, 'r') as susy:
                        with SusDir() as susdir:
                            susy.extractall(susdir)
                            for susfile in sus.listdir(susdir):
                                if susfile.endswith('.osu'):
                                    with open(sus.path.join(susdir, susfile), 'r+') as susy:
                                        susu = susy.read()
                                        susname = susu[susu.find('AudioFilename: ')+len('AudioFilename: '):]
                                        susname = susname[:susname.find('\n')]
                                        sustist, susle = susname.rsplit(' - ', 1)
                                        susle, sustension = susle.rsplit('.', 1)
                                        print(f'Found That {sustist} Is The Maker Of The Song')
                                        print(f'Found That {susle} Is The Name Of The Song')
                                        if '\n' not in sustist:
                                            if '\n' not in susle:
                                                if 'Title:\n' in susu:
                                                    print('RepLacing Title')
                                                    susu = susu.replace('Title:', f'Title: {susle}', 1)
                                                if 'TitleUnicode:\n' in susu:
                                                    print('RepLacing Title Unicode')
                                                    susu = susu.replace('TitleUnicode:', f'TitleUnicode: {susle}', 1)
                                                if 'Artist:\n' in susu:
                                                    print('RepLacing Artist')
                                                    susu = susu.replace('Artist:', f'Artist: {sustist}')
                                                if 'ArtistUnicode:\n' in susu:
                                                    print('RepLacing Unicode')
                                                    susu = susu.replace('ArtistUnicode:', f'ArtistUnicode: {sustist}')
                                                susy.seek(0)
                                                susy.write(susu)
                                                susy.truncate()

                            print(f"Mission Susful - f'{sustist} - {susle}.osz'")
                            sustil.make_archive(f'{sustist} - {susle}.osz', format='zip', root_dir=susdir)
                            sus.rename(f'{sustist} - {susle}.osz.zip', f'{sustist} - {susle}.osz')
    except Exception as Suseption:
        print("ඞඞඞඞඞඞඞඞඞඞඞඞඞඞඞඞඞඞඞඞඞඞඞඞඞඞඞඞඞඞඞඞඞඞඞඞඞඞඞඞඞඞඞඞඞඞ")

if __name__ == '__main__':
    susy()