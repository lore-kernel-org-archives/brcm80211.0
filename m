Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00D512FF9A
	for <brcm80211@lists.linux.dev>; Tue,  9 Apr 2024 14:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712671318; cv=none; b=FgP4dFVHJNYBbS2FHanTGViUmWVza2dDfbT60Mjwn1kX63DRTRxs5ux7aEcxMKvm7WDKPnZGJRLeI3uVPFGvafj9TN8LI8x4U7Nbh/mK6aXVvajzcHTFLi9fEO896oboUAbPpeDYMjwCRC7bv/qmOgFQz9VjwXAE8RNxGvf+i3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712671318; c=relaxed/simple;
	bh=WVcmmCzMCx0qOzeVSGr+rFq9VNZEW9SgsVKpHYBH4Jo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K+L6kd8ZDl79lcJNMBNAjUVjJfDTEeSrEfYeVWshIN+hJMmguhq/lcMrQM1Ywn5u+/K++xvRuUYupQmriCuiACuSHycCfxjfmIDARSgdGCMWi8CkxEVX1tJHLoP44GI9fHRllfqYDE2hCl96E0uml+O/LL5XnRnePil5FP8Fjbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=D0agwPwN; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="D0agwPwN"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d4886a1cb4so68301241fa.0
        for <brcm80211@lists.linux.dev>; Tue, 09 Apr 2024 07:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712671315; x=1713276115; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WVcmmCzMCx0qOzeVSGr+rFq9VNZEW9SgsVKpHYBH4Jo=;
        b=D0agwPwNYopqrOUPye9G1DLC05WzY/waPMG9Go4jdNATt+8oLk1HqntCbrn3kKDE6x
         0enHMyvkqJwsn6rRDAKzZb+lWzHPl8MsJG88k/0BEMJdrL1qgPREBYj8tWSDXJmFh94V
         LcFksypmRazhQAjEhlhyfA0cNIbLBakfrnLgHogcxRK3Q97ez9YfHxsfuAGjUR//pBf0
         WYsEJyj/ngR7zJhDZrbrge+zLmrjB7mw1UGyiiP+xQGDroo4wQ7Ix5AbFzSrcvOMcF42
         FTIPbKRsNq0D3zjawZGz62h9iYx1Ichx95uTG4eMvaz41oWAdRCrn7cOJvF22vECk+kc
         9r4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712671315; x=1713276115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WVcmmCzMCx0qOzeVSGr+rFq9VNZEW9SgsVKpHYBH4Jo=;
        b=kSoyLJGPBYseDB2Fbmuzj17RbsRuWzvCeY1YDfiqcRxEAZN94pEezfju5e+uoeRdUJ
         X+xdoQf2DX5mmcFnUSjT+imIhfJvzRQDOjzPKgiOkgH0YSJ9pGtnDdxozEe7zExO2th3
         VyvFgaPkhY3c9Lw5BS7VPHSFMiAFw+nJHncmAWW3ffSGddMJlUR89bCvTXHmvL+rrzKP
         bBRUSXVNDzTUpsfa4GH3Wl3lbhVI18K9+zLHHvDPTzmYMcA/SP4OrtnLVaLGW/MX5uKU
         gRWLVxKr2ygaL99MLQ8D3pCrhweQCFfrK5GQSYn3rOcznal2ZuNEZS1PBGjSk9gPoElU
         RfIg==
X-Forwarded-Encrypted: i=1; AJvYcCX4zWVHowT9QAifeAQ0pOBWc27ee+F9HORCghQU25NTuWcObyWrI275klvaBnx732TrHS1IXQJV1vWdKvNIR1jYyohDbAXy1r8S
X-Gm-Message-State: AOJu0YwgyqpQMnPv3DsPICRVdXhaIpteW1wOiRBKTEuYCygDnefP847P
	BT3fXGjr1hCkR/aEICWH5dOMg2rcaUZSM7kTuswFRYSE9n3nOiKksDvVQutLcGP3HjDVNKZ5MZY
	b9fS7XWLuORBFllUHoD724pXE64qDbO8p7GdlCQ==
X-Google-Smtp-Source: AGHT+IE0BTLqNhCg/BINBcFyauRaMvF/trglatuDvkvJ1Zps7+gNBKvwiRvgYkhWF8C4ymW2ozFLRyADZMwLTSRX/9s=
X-Received: by 2002:a2e:87ce:0:b0:2d6:dac4:7d4f with SMTP id
 v14-20020a2e87ce000000b002d6dac47d4fmr10185577ljj.4.1712671314663; Tue, 09
 Apr 2024 07:01:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240408231727.396452-1-andriy.shevchenko@linux.intel.com>
 <20240408231727.396452-3-andriy.shevchenko@linux.intel.com> <ZhU57jB_pVvDz0ZR@smile.fi.intel.com>
In-Reply-To: <ZhU57jB_pVvDz0ZR@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 9 Apr 2024 16:01:43 +0200
Message-ID: <CAMRc=Mdzc2gSEX0h0Uwcxr2qMgwLLXfhJda=3AkNNYsDBQre7A@mail.gmail.com>
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

On Tue, Apr 9, 2024 at 2:52=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Apr 09, 2024 at 02:12:51AM +0300, Andy Shevchenko wrote:
> > $ scripts/kernel-doc -v -none -Wall drivers/gpio/gpiolib* 2>&1 | grep -=
w warning | wc -l
> > 67
> >
> > Fix these by adding Return sections. While at it, make sure all of
> > Return sections use the same style.
>
> Since there shouldn't be hard dependency to the first one, can you consid=
er
> applying this one, so it unblocks me?
>

I'm not sure what the resolution is for % and HTML <font> tags in the end?

Bart
