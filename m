Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0E31CCEFC
	for <brcm80211@lists.linux.dev>; Wed,  4 Sep 2024 14:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725461634; cv=none; b=WO6PD/3IMQfP6oHtLb4iF6kp2hLnA6EkywHJhYMv6Ym13IMPXAJ2Qw6Cfx/UlGNPV9Ig97E1vMWBjPRGRVeVCoTpv1UK6pr4DamMMZh++6RfMdGGXfCDQ1vtQXiRjavZacmnz/USHkOfGVSH0TDNeO/G7cL+fz8tVJ1dElJy3O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725461634; c=relaxed/simple;
	bh=x949IdhBGiEjjv/A0ydxf0MZtvlczgR0jv1B5+4oj/I=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZrAUANg0u9qiAwnDQnfaNW/An1ocvtEzmS3dmkUDL3AED65RcUTCLrbK1h/3IkGccgMOyyUM9Get5xIKs5ZQC5LVvG+4mBvLYBjlbJXkZfFFMLyWyHPnqoIM3rxGEKhbzHpG1mxb8ySYNFYTW2kuv8LxltiqE2AxcZ+KAefgmUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IjlcN5Z+; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IjlcN5Z+"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a83597ce5beso145215066b.1
        for <brcm80211@lists.linux.dev>; Wed, 04 Sep 2024 07:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725461631; x=1726066431; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=maoPS4oxSTuZ9S/xU0gayMwVs7HWVgQua2YIMDRQrMc=;
        b=IjlcN5Z++dwPAvpsKX5slDEUU4EjUH4TVBKGircahOi1spfab14ffAhpwgNJmCDKGk
         1PZKrEgWJAOxxdZ8/bDzUQLFkV44ehw2xF1kMI+/lY8ttVSuVjNJfaWBoCxq2xTrA6Tk
         xHnGlsw5089qNYSVlVIXdL1hyLRI3X2WoJqQrqFp4nkBiz5400lBSDv6ISReEj1Pv4UX
         OcdHWYhj9QL0zenSswzATIH3IkdxRHMaoIjGffhhWatZgooEIEMHKdt0O76jPjXA4VYJ
         Nc5cG8Lu10+fPzm/Jr+Rv7tTFRo7o0uXhXlfuuXrBTo0h35Fx8fFRrOGUIEsuU4aA/Du
         13Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725461631; x=1726066431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=maoPS4oxSTuZ9S/xU0gayMwVs7HWVgQua2YIMDRQrMc=;
        b=ew6mzfKqcoOfvFKtzmG94NJih+jfWUQ7CcWRRZT/fua/AcC8VGUYOJ6yINOQezJaWa
         IRvp98W4grdj7NgQOeN5jsKnasXJieb3zajlXqgQ960Sjdw2DMRdUGjv4huXUgjYRdLb
         01TGqPhTDKLRT2kQwHZIMiB6opG9rS/XJ2t93yySnEiKOaWQ5nfLcx0ZFjdNw/8DpA6z
         KZmwbcE4fsKO5z6nYwKtPp6JJz9vXdg95GPsDU+Igczk/SoruJ7XSU5IP3OYoatAlSYv
         jpmR84leSBTfNl6EU/YT1wgn/oetRXNWvLkIlrmu2OUTUeMnVJV8zJInaDg8cuX4lTnw
         4HpA==
X-Forwarded-Encrypted: i=1; AJvYcCVZ4ZJ95luCn94h0tPsrEBtnTYe+6KiNZAETrdKBGV3YhTP58Z49rgzbATIM3ZUlzZDZ9II0Ng8YZg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzx9LtadI6UGgRSwJvgE+oYj60H3wSs5c3Fqn4/5ebRLAtBSlsJ
	Ci44mxG++DZNh01Rq0MAJS6rj38WpZyNs58Xxrto45dnJAAVngl3
X-Google-Smtp-Source: AGHT+IEFoTw35/FdxNCVm+/H9zZa+NzgrnOff+RYNxn8b2GRrl1sC4DkdjOCWReulr0J2guyrg1gNw==
X-Received: by 2002:a17:907:3a95:b0:a7a:a4cf:4f93 with SMTP id a640c23a62f3a-a8a4319cf62mr156412066b.32.1725461629930;
        Wed, 04 Sep 2024 07:53:49 -0700 (PDT)
Received: from vamoiridPC ([2a04:ee41:82:7577:2f85:317:e13:c18])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a62037380sm2240566b.47.2024.09.04.07.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 07:53:49 -0700 (PDT)
From: Vasileios Amoiridis <vassilisamir@gmail.com>
X-Google-Original-From: Vasileios Amoiridis <vamoirid@vamoiridPC>
Date: Wed, 4 Sep 2024 16:53:46 +0200
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Vasileios Amoiridis <vassilisamir@gmail.com>, linux@armlinux.org.uk,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
	linus.walleij@linaro.org, alsi@bang-olufsen.dk, andrew@lunn.ch,
	f.fainelli@gmail.com, olteanv@gmail.com, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	nico@fluxnic.net, arend.vanspriel@broadcom.com, kvalo@kernel.org,
	robh@kernel.org, saravanak@google.com, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v1 6/7] wifi: wlcore: sdio: Make use of
 irq_get_trigger_type()
Message-ID: <20240904145346.GA68482@vamoiridPC>
References: <20240902225534.130383-1-vassilisamir@gmail.com>
 <20240902225534.130383-7-vassilisamir@gmail.com>
 <ZtchHGEBtn-BVB-l@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtchHGEBtn-BVB-l@smile.fi.intel.com>

On Tue, Sep 03, 2024 at 05:45:48PM +0300, Andy Shevchenko wrote:
> On Tue, Sep 03, 2024 at 12:55:33AM +0200, Vasileios Amoiridis wrote:
> > Convert irqd_get_trigger_type(irq_get_irq_data(irq)) cases to the more
> > simple irq_get_trigger_type(irq).
> 
> ...
> 
> >  	memset(res, 0x00, sizeof(res));
> >  
> >  	res[0].start = irq;
> > -	res[0].flags = IORESOURCE_IRQ |
> > -		       irqd_get_trigger_type(irq_get_irq_data(irq));
> > +	res[0].flags = IORESOURCE_IRQ | irq_get_trigger_type(irq);
> >  	res[0].name = "irq";
> 
> 
> >  	if (wakeirq > 0) {
> >  		res[1].start = wakeirq;
> > -		res[1].flags = IORESOURCE_IRQ |
> > -			       irqd_get_trigger_type(irq_get_irq_data(wakeirq));
> > +		res[1].flags = IORESOURCE_IRQ | irq_get_trigger_type(wakeirq);
> >  		res[1].name = "wakeirq";
> >  		num_irqs = 2;
> 
> Since you are touching a lot here, consider also using macros from ioport.h,
> i.e. DEFINE_RES_IRQ_NAMED().
> 
> This will become something like
> 
> 	res[0] = DEFINE_RES_IRQ_NAMED(irq, "irq");
> 	res[0].flags |= irq_get_trigger_type(irq);
> 
> 	if (wakeirq > 0) {
> 		res[1] = DEFINE_RES_IRQ_NAMED(wakeirq, "wakeirq");
> 		res[1].flags |= irq_get_trigger_type(wakeirq);
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

Hi Andy,

Thank you very much for reviewing this, I will check this out
and apply the proposed changes to this and the next one.

Cheers,
Vasilis
