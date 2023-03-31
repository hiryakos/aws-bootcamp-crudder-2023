-- this file was manually created
INSERT INTO public.users (display_name, email, handle, cognito_user_id)
VALUES
  ('Eyob Tesfay','eyob@ymail.com' , 'eyob' ,'MOCK'),
  ('Eyob Berhe','eberhe800@gmail.com' , 'eberhe' ,'MOCK'),
  ('Hiryakos Eyob', 'hiryakos@gmail.com','hiryakos','MOCK');

INSERT INTO public.activities (user_uuid, message, expires_at)
VALUES
  (
    (SELECT uuid from public.users WHERE users.handle = 'eyob' LIMIT 1),
    'This was imported as seed data!',
    current_timestamp + interval '10 day'
  )