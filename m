Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAD112F5BB
	for <brcm80211@lists.linux.dev>; Tue,  9 Apr 2024 14:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712672340; cv=none; b=TDiH+c+uXirJIcjFKaAkxM/abr87oFAfn2yi/i/qaaufytweRM28RdoB5fDlFom0kxTdxC5w8E2xvqc9MCI8+O81o21QyRGWC6hwhlVPZXfLm21LWiQh+rZTAp0EL4MzG70Q04pVI8M7WO+8HEwHREQzLIZOMkb6BSEk063T8/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712672340; c=relaxed/simple;
	bh=eMkcUK06qPDLhvDjE1B8TO+83at8akeI50jFFu8wgFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SipE96VAsVHVV9MhAXcP2Dr21ekF5Npb7MqvQ1/ZVxVA+SAoJ/NLgTRbE/nUQpFLkwOTApU5KqtXh2UDo5xv+qCyjh1C/CdrE2t3AhB6CS2rP7H/S1Enezck52zLpNLv1/AJdA+O7AA9JtuRjGRzbytCEV4QILmNoSJDc8eepUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sU2on7Uj; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sU2on7Uj"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-516a01c8490so5565384e87.1
        for <brcm80211@lists.linux.dev>; Tue, 09 Apr 2024 07:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712672337; x=1713277137; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMkcUK06qPDLhvDjE1B8TO+83at8akeI50jFFu8wgFs=;
        b=sU2on7UjGQkIzLkexwIJnQWx675L7oOmfwxdmKgqBAP28EFxKz8eo8s8aBZpViVMy6
         WHpUcQz9mgcHlg0KtqKJs/BfmcBbP7RhxHk0PqAKR1SuUYAZjx/MUYVsqq7FE+Tf+Ec2
         swYguXA+bEnC4Mcg8LTsfetw6wZpOQi8uVPP2ZjCj/O+ZbVg7DBSZuUPxGpMvdsmXHFv
         FPu4DOOMJk9HQKFEr5cbOE0CfJBZGg3AvE7FuSaniwjUs89vAYa+2KdFujKUmE7UwVxA
         ADhxEsrtZgG9yvzrZwD4vPt2PVm7SbwkgRdIaXH1TD5URc5PvCD1j+BIYtca5X/paz+K
         i3Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712672337; x=1713277137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMkcUK06qPDLhvDjE1B8TO+83at8akeI50jFFu8wgFs=;
        b=YwWN2Kha6X7DrCRzEpVorvYL1VDl+xMxbWHVrTj40rOnrmIOWmPVyM3BdCkkWGuoym
         jdPxsbdMJT9/p2kAlXxm65m+cNW30bQpmqNkokH6UfF0WYj1k/LxoSEaiGRkrd0UKqnr
         moqlGLXIwp9GVsmZLA/ee8qQiThdWyQGmE7WUlVzYJnYHksISSljRQ0r/TnKBLDmLjAv
         7/2xgDO+TfKCDcfQrvTjxlVrwMcuYmLxlki9LF1VF5V0GoAL23pB8YAB++hjzVK4FTKg
         VxtR0LCVEKgPjG9wHvRNjTB7iQXlTuJAeat6qpLP7lGNj2MWwoui+hNPypnVRm9JtmjM
         zDpw==
X-Forwarded-Encrypted: i=1; AJvYcCUw3YAF0jG5Rc5WiiT0uy8D3Uhn6IuITneeyzERfmtYfkPLLfr43AGouU0QVRTav1do5CiHJlFD94x5CpS0omBA5z71xAQd/ZHX
X-Gm-Message-State: AOJu0YyUGxjBGq/bZ7BHkUtXIHJaGG1nv7FWqZYIKe/4h/FKq5QLjxWS
	Q5vHQ50WbKVYWcTWJkXcuDBSjp89vOdUxN9p3BEyk8LKaEhPQZwTnO99E/fT8ApJlg6qwjb5ed3
	Wp0msogTS0RDXi27HPW5SQY4bZcw47SpMIflYFw==
X-Google-Smtp-Source: AGHT+IE3u+ZalmS8qBssVMXi5KRadHKoy9rZZQtArJs1lzIFCPJu561ovsAqj4VFT6R7k9J6PFrMucLi+4ucD6DJTkU=
X-Received: by 2002:a05:6512:36cb:b0:513:df5f:38cd with SMTP id
 e11-20020a05651236cb00b00513df5f38cdmr932555lfs.4.1712672337514; Tue, 09 Apr
 2024 07:18:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240408231727.396452-1-andriy.shevchenko@linux.intel.com>
 <20240408231727.396452-3-andriy.shevchenko@linux.intel.com>
 <ZhU57jB_pVvDz0ZR@smile.fi.intel.com> <CAMRc=Mdzc2gSEX0h0Uwcxr2qMgwLLXfhJda=3AkNNYsDBQre7A@mail.gmail.com>
 <ZhVLcNI3rRhWs9_D@smile.fi.intel.com>
In-Reply-To: <ZhVLcNI3rRhWs9_D@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 9 Apr 2024 16:18:46 +0200
Message-ID: <CAMRc=Mf7aNuQfQtOEGO42jMNpCsLjetLYg5YwavLyDu2rz6X1A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpiolib: Update the kernel documentation - add
 Return sections
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Arend van Spriel <arend.vanspriel@broadcom.com>, Kalle Valo <kvalo@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 9, 2024 at 4:06=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Apr 09, 2024 at 04:01:43PM +0200, Bartosz Golaszewski wrote:
> > On Tue, Apr 9, 2024 at 2:52=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Tue, Apr 09, 2024 at 02:12:51AM +0300, Andy Shevchenko wrote:
> > > > $ scripts/kernel-doc -v -none -Wall drivers/gpio/gpiolib* 2>&1 | gr=
ep -w warning | wc -l
> > > > 67
> > > >
> > > > Fix these by adding Return sections. While at it, make sure all of
> > > > Return sections use the same style.
> > >
> > > Since there shouldn't be hard dependency to the first one, can you co=
nsider
> > > applying this one, so it unblocks me?
> >
> > I'm not sure what the resolution is for % and HTML <font> tags in the e=
nd?
>
> Most of the constants are without %, so less churn now is to drop %.
> If you think otherwise, please, fix it and I will rebase my patches later=
.
>

I'm not sure I get the logic of it. If the kernel-wide standard is to
use %, then we should work towards using it across the GPIO code even
if we do it a few lines at a time instead of going backwards just for
consistency in drivers/gpio/, no? We don't need to fix everything now
but if you're touching this code, then I'd go with %.

Also: what about the s/error-code/error code/g issue? While we should
always say "active-low", I think error code looks better as two words.

Bart
