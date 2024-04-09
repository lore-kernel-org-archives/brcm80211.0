Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA8F7F7EE
	for <brcm80211@lists.linux.dev>; Tue,  9 Apr 2024 09:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712655772; cv=none; b=JZZdkN6/aYB9nIrh02+tsyjO7nZwlM9dyFtp6z9J6td2b73gHnsKUZqUpeNyhuhGr8c8JUTBRds4rjqv1uK1CpOGcvx4autUCzmKq73DCXC4BR/Z8L4l8m3Rw3Pmz98LvVcfuzrDFxV6iAlnlYt3ZYcl9GwecacVSFsNu10ZNKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712655772; c=relaxed/simple;
	bh=ytL7QdYp2hCqyew7adjYY1rWgd8CDCZw9v1gyruAj60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aVFv9G8ekX3Rkj8yg/AGuPuifRO2ta7xssfuFxbD/7J91PVzZnfLrDPSKWLWtmag6Jmu5vcxXjMW5cWsvn7GujgOKNdTK4gICczS93bbaK7p6fnasEw4whO2FOgdweyMeOL21PnV43IbK1GTLCt+6lVKlv1MH2Kea5YXPKqAyiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UA17TF8R; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UA17TF8R"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d4a8bddc21so76311391fa.0
        for <brcm80211@lists.linux.dev>; Tue, 09 Apr 2024 02:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712655768; x=1713260568; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRkNsSj/lYNCA3MRycU0zvpqCVRND9tlWV8O4KsTnlc=;
        b=UA17TF8Rf4EEkDhpAzANn8UbNImlG2aXGGPC+zOZ22iM7TSQgDn2cy6LFANwoVUwo6
         nIp7WQWMYgXlVJGA2c27x42gGmRw3mZmE9k6HrF6XJdIvdO+4+VlPmYd8VnzrkvWhO6P
         T2WrPPBooWDxQLNT0Lv6L60LLvBXqrFdJjkQav12iytP6kurTE1BO9CA3sJsDMTBPq2L
         SAuag9Bl9T5iX8yxX+j0gmtIHNZZ+NDSutoG+8OTbIZtpRx7zPpvbFLqwl9HSnPT3LIu
         03t6+mZz2HpZpeGstD1Hit5fNiK5LtFX8mfNZXM6sixgUeWMsijpr8Xj1iEadHEmv+Nl
         RqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712655768; x=1713260568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FRkNsSj/lYNCA3MRycU0zvpqCVRND9tlWV8O4KsTnlc=;
        b=pe+bjhs6Alg6I4dRwWuH9iRzihLRbv2UYTGe+6K5EGTSzUQeUNXQnM5+aen5rwR2qw
         D48Xw3FokXyGWl8Nyoog3wgg+z1ATQzyS4xyJ2ArO1KZzMeTSKbz7eb8Y4qng8G6ugit
         xcsgGrwWYJ0dkPWJKv3B2qOYxpYyi4lSxIIs1S6t/ixNZbNGVIvQ7YXIcrMFPNGEA/p1
         i7WTxg4AtlJ45mZd3mQH80+a3YGhFR+jyUaXTN0Qs+K+GX4vB5OFx8l5+NH0/NG/MOts
         blQXKVW5WT+swWvhOQwwLYe7DBDszpLtQybdfo+lPiw8+OCUNI69gsoDJNHb0Z/Syi3i
         y1VQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUtktN+xzBChKxMHbc8ualMaH9EoC469rAkdzezuuGGrhgFkKzYUsaJLtgmGcODa17WMjCMkQw2Kfj0HhT7qUs0LRaED4L1BzY
X-Gm-Message-State: AOJu0YzYTXyTvo9kRkaVqPvDtd6/Q8+2O7GmPZzpZ63ZSX2Z4HkOn7Cm
	TIZErmpH2EuqTtZJ8WrY0rDpnjRTgiK8cGkGnn6Oz4etnZDVz35703jVvjTfQp7ME0IciEAaym/
	3SxPHwJ+hJJFtkf0353e8c8GFJAyPyzqo7fKEgA==
X-Google-Smtp-Source: AGHT+IGLok3BTsdCtcp+mQF0FlIfpGRtTXkNrJj6FjV/E2JhCIYngUvEmtKxHaZSUGiU6FzXlS6ipOOBorjeZLPGLJA=
X-Received: by 2002:a2e:854c:0:b0:2d8:5af9:9097 with SMTP id
 u12-20020a2e854c000000b002d85af99097mr6406610ljj.42.1712655768359; Tue, 09
 Apr 2024 02:42:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240408231727.396452-1-andriy.shevchenko@linux.intel.com> <20240408231727.396452-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240408231727.396452-2-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 9 Apr 2024 11:42:37 +0200
Message-ID: <CAMRc=Mf73fFHo83gNvDXGy9BosB1MNz_=8kt56hLA12bPBb8CA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpiolib: Fix a mess with the GPIO_* flags
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Arend van Spriel <arend.vanspriel@broadcom.com>, Kalle Valo <kvalo@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 9, 2024 at 1:17=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The GPIO_* flag definitions are *almost* duplicated in two files
> (with unmatches OPEN_SOURCE / OPEN_DRAIN). Moreover, some code relies
> on one set of definitions while the rest is on the other. Clean up
> this mess by providing only one source of the definitions to all.
>
> Fixes: b424808115cb ("brcm80211: brcmsmac: Move LEDs to GPIO descriptors"=
)
> Fixes: 5923ea6c2ce6 ("gpio: pass lookup and descriptor flags to request_o=
wn")
> Fixes: fed7026adc7c ("gpiolib: Make use of enum gpio_lookup_flags consist=
ent")
> Fixes: 4c0facddb7d8 ("gpio: core: Decouple open drain/source flag with ac=
tive low/high")
> Fixes: 69d301fdd196 ("gpio: add DT bindings for existing consumer flags")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpiolib-of.c                     |  5 ++---
>  drivers/gpio/gpiolib.c                        |  8 +++-----
>  .../broadcom/brcm80211/brcmsmac/led.c         |  2 +-
>  include/linux/gpio/driver.h                   |  3 +--
>  include/linux/gpio/machine.h                  | 20 +++++--------------
>  5 files changed, 12 insertions(+), 26 deletions(-)
>

I don't think ./dt-bindings/gpio/gpio.h is the right source of these
defines for everyone - including non-OF systems. I would prefer the
ones in include/linux/gpio/machine.h be the upstream source but then
headers in include/dt-bindings/ cannot include them so my second-best
suggestion is to rename the ones in include/linux/gpio/machine.h and
treewide too. In general values from ./dt-bindings/gpio/gpio.h should
only be used in DTS sources and gpiolib-of code.

Bart
