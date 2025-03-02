Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54603258A
	for <brcm80211@lists.linux.dev>; Sun,  2 Mar 2025 15:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740930467; cv=none; b=MuzgMQsYGGa7ETkLLai+Z3NWU9o6+KeEcrsHXEIDtyhJOM/fWLkiQU9J8EB42mjuqHTseuooarq5s/GwP501o8/WPWFo/hHMhoOcsQYpZD+b0ODzfqKXTbWyz0PphxvUNiyfpG7LB+XZ/JLK0tS8cTjtc215GghgIVKdw8oNibs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740930467; c=relaxed/simple;
	bh=Okh8B31yIedOwS+wAZPKlNc0foFVtviDzKYErsu9Gw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jlJQwn/runmiaoAOR6rkpC5BDhlkGFzG9K4RUCKCPQqJbL+Clir5G5rmiUFG3FfZvQ1Iy9yEjP3y1JHvLwC+qPknWdt3zi+VQA624G8B7dVTrHq7KcGCcZ7oRTBkNpKCaaCR0qVSMEp+kphgkw4USoUzGGFbVwWP8u9/zH0Y0bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9NOAfpX; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9NOAfpX"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6fd47dfe76cso24493327b3.3
        for <brcm80211@lists.linux.dev>; Sun, 02 Mar 2025 07:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740930464; x=1741535264; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CCT1sTVFptoP0GXpHD4z8aJ9CCOqcWh1+88rLPDB2Qo=;
        b=P9NOAfpXsOp2/y1D4/R6JSQ1BrcsBcjgKzBXa/UqBj5QH7q+FCO4Yci3sUV+NWJpOd
         b2aEA2o/9JGId9xNXB53fDQwIu3eM8JemaKpj+NzHAM0RCX2Ig497MvthXtvcktJCJll
         416kN4qD9sKqcjUM3c6G1WEjig/b5y+twqDKmCi6PjPMuDriCpqLJbVoZbx8FfQWVe6s
         tTYJB6NuGBhJ+9ajn7f7DKmOCgV17FyMqA7yuyrAfprWXQAtlioGokIAd/77qs3A/RVj
         xS7cqUju4vWsnnaspt00zqdSdnrjBzzzDOwCSpoiuLIivptvjMO8isSiUxO08vZ1p26I
         Ve3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740930464; x=1741535264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCT1sTVFptoP0GXpHD4z8aJ9CCOqcWh1+88rLPDB2Qo=;
        b=LRr84VO68TB8aFXmkf5Sxvlmvckmn621DFlgs462dcVVuLw8doI8dII392JZmRG4yR
         r7BRX6QfVI8ZuPFaIf6T9CHCNDcw1vO8DC7jJWgrQD1KO0a3iLENLi9pk0nDKH74qlTC
         h0maAtz69hfz9Mlg5w4tz1+Ho1Q/kGS5pl+pc0yvojFInX2Ho4bY8dHSB3Owjj7Ebxti
         k0Kx+wRvjakclxhoRCk2MvBGa9Guj8CqJduiv/CdpLN7+YUGSmvHtY4PfX9kZEi21RXP
         JUymaz3S71yVz/xXN2LezJq0kaNyez0cdGxBnLs0MLn6njB0Jbo2y8ZabiGhkyyk0+Ol
         iwQA==
X-Forwarded-Encrypted: i=1; AJvYcCXgsHouXsmMXlJLu6gHzdEIGROtPUVWahEYs5WhC1e3y0GjTCbgWzsZs9tldds8QQyvGaIwlHjWDdQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxTj9YZ5bEYp8y989OaX59c4Lo2bs7auniLJdCcB7Zjc8yQcZsz
	PrSIIu60GyVZe4cG5I+omanzuMRxDWd20p7H5MIQyDTxEYcw2Hen
X-Gm-Gg: ASbGncv13aV4BFEDpkJ6TJecEvAEn/qeliKqF8vFkSskyeNW7RGiGGGPKnQ49nKAm+d
	vRDB+zpkUft1HneURFuVh9LCly95Vt32FuIP5i4NLBkujM+1cVVHYhuNkbgF65AeA/pxXE3yd2J
	z8XWzEceyOMruVXrc94z5Qha6DWzYeNmK9puEDxVCX30oCKvKI87YRqzHsF0wG/iH+N8fYLJ0Zw
	Ab0OgRi8MFA6S5ybB0K3bDd6k1gU8MDShJblmj00DKXFz8VtA74ZpRl/RjetWLuVkoWWfeJLg5a
	otwpWu+1bX/3iQk0u7BvSV6F0IGyOi50N7p3TgIZtQNqPvet/2Gy0wfZswiccOK9kMFDT6J4jpq
	LAJTz
X-Google-Smtp-Source: AGHT+IEfQ39kTql5XsYDhHYJ6TV6j9haA6dlCxpju/Rqc4ygrtquBMosdzic0x4c9/qeMrvSjUoEBQ==
X-Received: by 2002:a05:690c:6301:b0:6fd:4485:9255 with SMTP id 00721157ae682-6fd4a122c2amr115575717b3.24.1740930464153;
        Sun, 02 Mar 2025 07:47:44 -0800 (PST)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6fd3ca41e81sm16218887b3.29.2025.03.02.07.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 07:47:43 -0800 (PST)
Date: Sun, 2 Mar 2025 10:47:41 -0500
From: Yury Norov <yury.norov@gmail.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
	eajames@linux.ibm.com, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	dmitry.torokhov@gmail.com, mchehab@kernel.org,
	awalls@md.metrocast.net, hverkuil@xs4all.nl,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	louis.peens@corigine.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
	johannes@sipsolutions.net, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, akpm@linux-foundation.org, hpa@zytor.com,
	alistair@popple.id.au, linux@rasmusvillemoes.dk,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH 02/17] bitops: Add generic parity calculation for u64
Message-ID: <Z8R9nQmfeVvfDiOn@thinkpad>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-3-visitorckw@gmail.com>
 <Z7zIBwH4aUA7G9MY@thinkpad>
 <20250226222911.22cb0c18@pumpkin>
 <Z8CpaaHv0ahHFVuK@thinkpad>
 <20250227215741.1c2e382f@pumpkin>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227215741.1c2e382f@pumpkin>

On Thu, Feb 27, 2025 at 09:57:41PM +0000, David Laight wrote:
> > It's still unclear to me that this parity thing is used in hot paths.
> > If that holds, it's unclear that your hand-made version is better than
> > what's generated by GCC.
> 
> I wasn't seriously considering doing that optimisation.
> Perhaps just hoping is might make a compiler person think :-)

David, can you suggest only things you're seriously considered to do?
Random suggestions distract my contributors and make them doing unneeded
work and experiments.

In the other thread you asked I Hsin to try your approach to GENMASK()
macro, saying you're lazy. I don't think this is the right way to
communicate, not mentioning that if you're lazy to try your own
approach, it doesn't sound nice to ask someone else to try it.

Thanks for understanding,
Yury
