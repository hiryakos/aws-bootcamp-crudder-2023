-- this file was manually created
INSERT INTO public.users (display_name, email, handle, cognito_user_id)
VALUES
  ('Eyob Berhe','eyob@ymail.com' , 'eyobberhe' ,'MOCK'),
  ('Eyob Tesfay','eberhe800@gmail.com' , 'tesfay' ,'MOCK'),
  ('Hiryakos Tesfay', 'hiryakos@gmail.com','hiryakos','MOCK');

INSERT INTO public.activities (user_uuid, message, expires_at)
VALUES
  (
    (SELECT uuid from public.users WHERE users.handle = 'eyobberhe' LIMIT 1),
    'This was imported as seed data!',
    current_timestamp + interval '10 day'
  )