Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA4D14F9F0
	for <brcm80211@lists.linux.dev>; Fri, 12 Apr 2024 19:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712951044; cv=none; b=jj4dnvBMqYaTbLnXYZ45ZQKIHxefCuv0Ht7KYmO68gyHQsyHjgWQc6lS/nmEacsJ3YnBtLvfuPmXI30f8PEXyDT4vX8/o/y1yuG1o5r+U918lBmOTOsxJUi1uhv0iubFCfnwEQXpdQrLvncT4FaC6dqMISsZBL6xCMykBNTcyWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712951044; c=relaxed/simple;
	bh=IoHqwPR/3f4QWQcrX8xBsgDz0K3wdj+JCIyUfWJkskQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sQ4peKZEwg0MeetPj7yLNY5LBUuDnJyNGCMrAVr4MPB6uG+LKquJxmkCPoA9Sbo7faPCPX1ebmW2ygN7G2iqzcq7XoxY7U134Ah9W6B2r64ZNkDq9NGDFG1fsjHy2bUCvWDQt8JEb9u9ear9pLJLozSDoVqSdD6IZ1x1t9LXFI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=TkUftyBn; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TkUftyBn"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d715638540so14699171fa.3
        for <brcm80211@lists.linux.dev>; Fri, 12 Apr 2024 12:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712951041; x=1713555841; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IoHqwPR/3f4QWQcrX8xBsgDz0K3wdj+JCIyUfWJkskQ=;
        b=TkUftyBn+3NiW6QWzA7zw1P9uSAOA3x6TOThNHwOwZiAm67m21q+tbmQxFMYYiCIt7
         c0KYEEwKPcL5r6mUVLaTAUZx2KHMt2bIto7pCAownJNm+O/jhfR8KxYKiRPGxOfSUs5J
         35A27n3UscW9kqmrO/N/YjEh1LOVeRQnsrS3k+KmnDDademKln0ixg1EOMuU3Ao91AOu
         CoxMIzquqGn989dvCII7bcTzIWINlkBLVMLiUc9qk2aEcoYSNVBbB1s0m5qKNr2uOcjO
         Gcd394QypvJ8+pl7TtP/499QMCz3nVh9HlVbUxiai/PbIDANSkOeUgjKI4ARKjS4HNoG
         3MaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712951041; x=1713555841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IoHqwPR/3f4QWQcrX8xBsgDz0K3wdj+JCIyUfWJkskQ=;
        b=bNKdrajpS0iKsxNSEAW2m6ctE4sFpaocd/Nm7ypbQZnrKviVWS62cIO6HVxflZ5r1r
         PHEc7LHVd9NseHuH/MuzVwRn2abhxi4u862OHqzwW3CFSUcswyji+InCTcMxNrePw7NC
         1b0oiBbsq1cFSxSB9TgeoCPKvvSFQKywLxy7pj21/tEGT5pZlabgzFu2PbHkvfK9cChK
         kwAJTk4NkDw+keNMruY7GM8lf8EtdFSZNouNt0+znM6vQYT8/xJupjK7YTbgWPj3da7X
         kZIkU8Gj4xs+KYDS51vjAPF2PUZ+kDMIi0FZF06oQpcECuVu+7UOCdgORKfxzplFdkyH
         W64A==
X-Forwarded-Encrypted: i=1; AJvYcCXFl5DH/1q3dWbAhh2r5sGCb5OdLEjqMi35lLgEt3KEcLbUQSNjDRE6kqWalakLX0LbBQt9IDUk3CExavvCYlZfEQnOin3wMF+8
X-Gm-Message-State: AOJu0Yz1jwgMIoz+HIm+GPoIBxeLGlf2myGEGW09b/7NPRKNM2/UobrM
	8C1WUGzCZ+M1MJe+j8jEXHUguZeh2EuxQlE8M92Ct/RV9T4fBOlhX7wZkAoFuUKnxo1ASwmZLzu
	1n6RR5s/jXQeyBRG7LEZUOiei3giV9leut/Asew==
X-Google-Smtp-Source: AGHT+IHDFaXNrNG2VuRajk4e/f9G/kVH1bAxuITsKhrhrInNpB6M6fKmkwCUyUP9OKMFBkar1WsP6Ai0nTF3XOH1wOg=
X-Received: by 2002:a2e:a370:0:b0:2d8:8b7:76e3 with SMTP id
 i16-20020a2ea370000000b002d808b776e3mr2331884ljn.11.1712951041199; Fri, 12
 Apr 2024 12:44:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240408231727.396452-1-andriy.shevchenko@linux.intel.com>
 <20240408231727.396452-2-andriy.shevchenko@linux.intel.com>
 <CACRpkdYaXVvtt3b9rFxU4ZNShD17Bm4XU9X3h4dY501iJy3kPA@mail.gmail.com> <ZhlSaFWlbE6OS7om@smile.fi.intel.com>
In-Reply-To: <ZhlSaFWlbE6OS7om@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 12 Apr 2024 21:43:50 +0200
Message-ID: <CAMRc=Me489H-mTfT1hfUsY47iKwoaVsf6sgkiBwBVkxJOBo9UA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpiolib: Fix a mess with the GPIO_* flags
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Arend van Spriel <arend.vanspriel@broadcom.com>, Kalle Valo <kvalo@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 5:25=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Apr 12, 2024 at 10:20:24AM +0200, Linus Walleij wrote:
> > On Tue, Apr 9, 2024 at 1:17=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> >
> > > The GPIO_* flag definitions are *almost* duplicated in two files
> > > (with unmatches OPEN_SOURCE / OPEN_DRAIN). Moreover, some code relies
> > > on one set of definitions while the rest is on the other. Clean up
> > > this mess by providing only one source of the definitions to all.
> > >
> > > Fixes: b424808115cb ("brcm80211: brcmsmac: Move LEDs to GPIO descript=
ors")
> > > Fixes: 5923ea6c2ce6 ("gpio: pass lookup and descriptor flags to reque=
st_own")
> > > Fixes: fed7026adc7c ("gpiolib: Make use of enum gpio_lookup_flags con=
sistent")
> > > Fixes: 4c0facddb7d8 ("gpio: core: Decouple open drain/source flag wit=
h active low/high")
> > > Fixes: 69d301fdd196 ("gpio: add DT bindings for existing consumer fla=
gs")
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >
> > The way the line lookup flags ("lflags") were conceived was through
> > support for non-DT systems using descriptor tables, and that is how
> > enum gpio_lookup_flags came to be.
> >
> > When OF support was added it was bolted on on the side, in essence
> > assuming that the DT/OF ABI was completely separate (and they/we
> > sure like to think about it that way...) and thus needed translation fr=
om
> > OF flags to kernel-internal enum gpio_lookup_flags.
> >
> > The way *I* thought about this when writing it was certainly that the
> > DT bindings was a separate thing (<dt-bindings/*.h> didn't even exist
> > at the time I think) and that translation from OF to kernel-internal
> > lflags would happen in *one* place.
> >
> > The main reasoning still holds: the OF define is an ABI, so it can
> > *never* be changed, but the enum gpio_lookup_flags is subject to
> > Documentation/process/stable-api-nonsense.rst and that means
> > that if we want to swap around the order of the definitions we can.
> >
> > But admittedly this is a bit over-belief in process and separation of
> > concerns and practical matters may be something else...
>
> Got it. But we have a name clash and the mess added to the users.
> I can redo this to separate these entities.
>
> Note, that there is code in the kernel that *does* use
> #include <dt-bindings/*.h>
> for Linux internals.
>

Well, then they are wrong. We should convert them to using
linux/gpio/machine.h first. Or even put these defines elsewhere
depending on what these drivers are using it for in general. Maybe
machine.h is not the right place. Then once that's figured out, we can
start renaming the constants.

IIUC include/dt-bindings/ headers should only be used by DT sources
and code that parses the OF properties.

But it seems to me that we need to inspect these users, we cannot just
automatically convert them at once, this is asking for trouble IMO.

Bart
