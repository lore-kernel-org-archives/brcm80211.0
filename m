Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC0412DDAD
	for <brcm80211@lists.linux.dev>; Tue,  9 Apr 2024 12:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712667336; cv=none; b=FLwR71UGinFce7NlLalQFdwUX6jvT++uhX00UwJASxzGJ8eTgoN0CrOxEWcAJBdS1eutDr6NXEfk+umcmxhPEPDbMN5c1EWfxGRkdaewD48bQyFMhbDY6afQAr2Oej/+bSdAaiMxwRhl0OIkzxfiiat5k27w7AJtI9TPM/6v2kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712667336; c=relaxed/simple;
	bh=28FvpAkubR7U/YnsKwvZJdGYuQx67JP9jJ7DevI04Bs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GGpS6a+IHMCWdkCnThO+DIkDnwkJ6Xy0OcMvxO5J9RDjZQYBE+XkWUiXM5mWfwZTSTCzUuRVyCeC3Ty59+mKaO5rLAYl4TAHUeFGsLsLiSWarsDwOqP9vtLKQlkw4cOZSL3PvmXh5AE3j5TGj/nRJnG/Os88EkI7BQHsRtsOlik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1C2/HDxy; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1C2/HDxy"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d715638540so66592461fa.3
        for <brcm80211@lists.linux.dev>; Tue, 09 Apr 2024 05:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712667331; x=1713272131; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ElDlfqr37WkHv45h6Xgla3cstFx6EJxDXR9PqWmhUCY=;
        b=1C2/HDxyn6QYPmJFPLKoXOE3+XeO6FEjC7VszUagC8rS+43zZSDIQg8b5yTsWf9qc3
         75MN2UBIi9E+OAJzpRDILxQFeygZzF7nPy4wp9VeliSWiRKa63Y5V4xeNUNFNLCoswzU
         3YQgUxkI7F1iMOMWiSj97qaS0gkujOlVUT7i6KwMtvAqkeid+M0/dhkzSlvkn9XLKZu8
         1GTod4Jf14X1tySYdiiBIPiFEdOs/I0+F1vW0lmRKV8RQ+/OgqUzx4he/T6Ou+gWmAmE
         75Q0aDv/x5nb+Ahdmhm8uum0lJaCni9JJfr+oKZ5g3Mf7yYiwR2KMH9tnK2xEeIRxwK9
         iiyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712667331; x=1713272131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ElDlfqr37WkHv45h6Xgla3cstFx6EJxDXR9PqWmhUCY=;
        b=pCYP8Zx9vg6n5z7so39hI/SlOsjq9iPCeZt2swc2GqKZN7y8G5dbDuxX2RxZkRNH6/
         VVQcG79Vp+lQtZabZo80Ha2Zjj4gBCjmSSaM9aUSbv70+G3W63yJRfuCog/keqZPhtwf
         bxaoPfNcE4sLF/0Tgy8hxXNHMivoAPpiIU2lYvpF2M6tQrcQAa2g2vu2qJ9NVn4KFuMz
         ID7tlht6HENO3Dd6xMFRaTWNuS5lrIYxClGlqCDL7iLv5v8x8pHjGrnlTB+Nd0N2Oh4h
         RLezSEQHpz+BbJWx8wT7JoEbV5KWQcs9E5kk29O8Th12A6Uuu9OsGbTE87QK9lpWPuy5
         yyYA==
X-Forwarded-Encrypted: i=1; AJvYcCVFIy0FOkfAQSQcBOCLs1BkMFow9itfP5CXk+jnP0Kbg5QgSyUiHfXidjVeSC3SvmsSU1RcZRo04F2yvkQpmfG8QdING+XCjXKH
X-Gm-Message-State: AOJu0YxnHQg1WbYQJPhs5lYy/1ZXxEx8xJa5Yok9ipc/jOugw+NaneEv
	gLvBlGxPKAZymKYteDFvXADiyxrU999FDSEF6e5TLlOMLVwNCOQlo9undixdjdzGWUFdBfPZZgg
	fBCsRiKzlgNBhi+j4NjK2lbXwLHDTxD7ZTy9ayw==
X-Google-Smtp-Source: AGHT+IElreytHxSdK3MjFouAJM+ZDxBIAatjdrl9atwum0J18I0K0pLO6B4r+Kvm4+ejftK0BHc2qci1wKAPT0U5X2E=
X-Received: by 2002:a2e:2285:0:b0:2d8:2fb1:3d with SMTP id i127-20020a2e2285000000b002d82fb1003dmr6423456lji.22.1712667331365;
 Tue, 09 Apr 2024 05:55:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240408231727.396452-1-andriy.shevchenko@linux.intel.com>
 <20240408231727.396452-2-andriy.shevchenko@linux.intel.com>
 <CAMRc=Mf73fFHo83gNvDXGy9BosB1MNz_=8kt56hLA12bPBb8CA@mail.gmail.com> <ZhU5uDJk_M_TtKH2@smile.fi.intel.com>
In-Reply-To: <ZhU5uDJk_M_TtKH2@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 9 Apr 2024 14:55:20 +0200
Message-ID: <CAMRc=Meh6K2zxpVPHvsDcr5vMMeagK7FGhnUPz3bb2rQQCPHJA@mail.gmail.com>
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

On Tue, Apr 9, 2024 at 2:51=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Apr 09, 2024 at 11:42:37AM +0200, Bartosz Golaszewski wrote:
> > On Tue, Apr 9, 2024 at 1:17=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
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
> > > ---
> > >  drivers/gpio/gpiolib-of.c                     |  5 ++---
> > >  drivers/gpio/gpiolib.c                        |  8 +++-----
> > >  .../broadcom/brcm80211/brcmsmac/led.c         |  2 +-
> > >  include/linux/gpio/driver.h                   |  3 +--
> > >  include/linux/gpio/machine.h                  | 20 +++++------------=
--
> > >  5 files changed, 12 insertions(+), 26 deletions(-)
> >
> > I don't think ./dt-bindings/gpio/gpio.h is the right source of these
> > defines for everyone - including non-OF systems. I would prefer the
> > ones in include/linux/gpio/machine.h be the upstream source but then
> > headers in include/dt-bindings/ cannot include them so my second-best
> > suggestion is to rename the ones in include/linux/gpio/machine.h and
> > treewide too. In general values from ./dt-bindings/gpio/gpio.h should
> > only be used in DTS sources and gpiolib-of code.
>
> Then, please fix that your way. It's quite annoying issue.
>

This is not difficult in itself but it's a tree-wide change so we will
probably have to send it to Torvalds at the end of the merge window in
a separate pull-request.

I don't really have time now, I'll be travelling for 5 weeks in a row.
I'll see closer to the merge window. Or next release cycle.

Bart
