import csv
import matplotlib
import matplotlib.pyplot as plt
import numpy as np

UCSD = 'UCSD'

BUCKETS = [0.1, 0.2, 1.0, 10.0, 60.0 ] # range(500, 3001, 500)
#COLORS=['#90B0D4', '#90D492', '#D4B490', '#D490D2']
COLORS=['#8dd3c7','#bebada','#ffffb3','#fb8072','#80b1d3','#fdb462']
COLORS_E=['#8dd3c7','#bebada','#80b1d3','#ffffb3','#fdb462','#fb8072']

def read_csv(f):
    with open(f) as f:
        return list(csv.reader(f))
def read_csv_dict(f):
    with open(f) as f:
        return list(csv.DictReader(f))

def plot_user_study():
    a = read_csv_dict('study/study-data/Types_Study_A_scores.csv')
    b = read_csv_dict('study/study-data/Types_Study_B_scores.csv')

    def f(xs):
        return [float(x) for x in xs if float(x) >= 0]

    def err(xs):
        #p = np.average(xs)
        #return 100 * np.sqrt(p * (1-p) / len(xs))
        s = np.std(xs)
        n = len(xs)
        return 100 * (s / np.sqrt(n))

    ## REASON
    sepconcat_a = f([r['1: sepConcat explain (1.0 pts)'] for r in a])
    padzero_a = f([r['3: padZero explain (1.0 pts)'] for r in a])
    mulbydigit_a = f([r['5: mulByDigit explain (1.0 pts)'] for r in a])

    sepconcat_b = f([r['1: sepConcat explain (1.0 pts)'] for r in b])
    padzero_b = f([r['3: padZero explain (1.0 pts)'] for r in b])
    mulbydigit_b = f([r['5: mulByDigit explain (1.0 pts)'] for r in b])

    ind = np.arange(3)
    width = 0.35

    fig = plt.figure()
    p_o = plt.bar(ind,
                  [100*np.average(sepconcat_a), 100*np.average(padzero_b), 100*np.average(mulbydigit_a)],
                  width,
                  color=COLORS[0],
                  yerr=map(err, [sepconcat_a, padzero_b, mulbydigit_a]),
                  error_kw={'linewidth': 3, 'ecolor': 'gray', 'capsize': 6, 'capthick': 3}
    )
    p_n = plt.bar(ind + width,
                  [100*np.average(sepconcat_b), 100*np.average(padzero_a), 100*np.average(mulbydigit_b)],
                  width,
                  color=COLORS[1],
                  yerr=map(err, [sepconcat_b, padzero_a, mulbydigit_b]),
                  error_kw={'linewidth': 3, 'ecolor': 'gray', 'capsize': 6, 'capthick': 3}
    )

    plt.title('Explanation',fontsize=24)
    # plt.xlabel('Problem', fontsize=20)
    plt.ylabel('% Correct', fontsize=20)
    plt.xticks(ind + width, ['sepconcat\n(p = 0.48)', 'padzero\n(p = 0.097)', 'mulbydigit\n(p = 0.083)'], fontsize='large')
    plt.legend(('SHErrLoc', 'Nate'), loc='lower right', fontsize=16)
    # autolabel(plt, p_o)
    # autolabel(plt, p_n)

    fig.savefig('user-study-reason.png')
    plt.close()


    ## FIX
    sepconcat_a = f([r['2: sepConcat fix (1.0 pts)'] for r in a])
    padzero_a = f([r['4: padZero fix (1.0 pts)'] for r in a])
    mulbydigit_a = f([r['6: mulByDigit fix (1.0 pts)'] for r in a])

    sepconcat_b = f([r['2: sepConcat fix (1.0 pts)'] for r in b])
    padzero_b = f([r['4: padZero fix (1.0 pts)'] for r in b])
    mulbydigit_b = f([r['6: mulByDigit fix (1.0 pts)'] for r in b])

    ind = np.arange(3)
    width = 0.35

    fig = plt.figure()
    p_o = plt.bar(ind,
                  [100*np.average(sepconcat_a), 100*np.average(padzero_b), 100*np.average(mulbydigit_a)],
                  width,
                  color=COLORS[0],
                  yerr=map(err, [sepconcat_a, padzero_b, mulbydigit_a]),
                  error_kw={'linewidth': 3, 'ecolor': 'gray', 'capsize': 6, 'capthick': 3}
    )
    p_n = plt.bar(ind + width,
                  [100*np.average(sepconcat_b), 100*np.average(padzero_a), 100*np.average(mulbydigit_b)],
                  width,
                  color=COLORS[1],
                  yerr=map(err, [sepconcat_b, padzero_a, mulbydigit_b]),
                  error_kw={'linewidth': 3, 'ecolor': 'gray', 'capsize': 6, 'capthick': 3}
    )

    plt.title('Fix',fontsize=24)
    # plt.xlabel('Problem', fontsize=20)
    plt.ylabel('% Correct', fontsize=20)
    plt.xticks(ind + width, ['sepConcat\n(p = 0.57)', 'padZero\n(p = 0.33)', 'mulByDigit\n(p = 0.31)'], fontsize='large')
    plt.legend(('SHErrLoc', 'Nate'), loc='lower right', fontsize=16)
    # autolabel(plt, p_o)
    # autolabel(plt, p_n)

    fig.savefig('user-study-fix.png')
    plt.close()


if __name__ == '__main__':
    plot_user_study()
