def solution(id_pw, db):
    answer = ''
    my_id, my_pw = id_pw
    for db_id, db_pw in db:
        if my_id == db_id:
            if my_pw == db_pw:
                return 'login'
            else:
                return 'wrong pw'
    return 'fail'