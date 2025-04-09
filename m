Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2145D277801
	for <brcm80211@lists.linux.dev>; Wed,  9 Apr 2025 18:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744224068; cv=none; b=u/ty18YrDQ8Ary5SG6XGPxW3I43yNm2AlEqvl8LvlAxK87SFLynfP+r8ZCe7rpmFRJRoETJTyOF2+vGEYyzr74tUcaiN1wiK0f2qEAFgdjCl/xYpNIChmY/CMiFWSjnDhqCF1qOtfJ2qu30cJ0ghKPo3vB7kcqm1uobm7VFXthY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744224068; c=relaxed/simple;
	bh=Px0VYlUsPOBY2ltEO2TpWLS9AYWWswCUY8Dh5/BwVEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rh+kn2Bd95E6avreCodvEr2vq/kqyFWnNPJ9NFJiWX+PZLjBC/lb7weFbNYSB/gI6N4FBc2y54dBvW/m2lbHyF8WeHBvy0VWmoL0XanrG0xOSx9j0xqXx72spz+0OrQfhlHqNqLZAuS3oSxgfLAxUvfxZIS+E4ZEoFYC+Uk5bGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2TLI4u4; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2TLI4u4"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-736b34a71a1so8321192b3a.0
        for <brcm80211@lists.linux.dev>; Wed, 09 Apr 2025 11:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744224066; x=1744828866; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y9MRs+OpXV0ogJQHvE9axw548ilRfDN2nGQrTik2VzY=;
        b=U2TLI4u4V1cv7pacaxc1H14JBRDaMja6ETw3Bg2eS05R1mz8ZvpOmwFwA7dAAAQu/P
         QvYPMxTn0CLROm18gg6tUM9NpJl2N2YslRIEGzi9QrZvQ5eRmY/neOH30v3Q0vkuzA32
         6/FuWDihBe2qYvoxvCEyLAvQq1SPAa93eNadRRMM9aBvAS0ec2R0f5JNwEtVfOpeanQu
         PlY9W0wih+xApQhWoJc/u5c9hxqdVYBnnk2ZhT9BLBbhaK0JiJ3b2ThXUPOkeMGZOBCv
         +vwcFRILQbQ0QDMaek6CzSuOrRGqTt8NShbOM9on9XN4am0oU+1o2DR9B8XwZsqn2376
         LKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744224066; x=1744828866;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9MRs+OpXV0ogJQHvE9axw548ilRfDN2nGQrTik2VzY=;
        b=thK3ILEbt+ptMbqJtkLuPoTs1Mordbw3pg9HB1ELWocTOzY/8EFWudZ6hkJArhiYwk
         /KSlPDk4n2rbJ81bTI426hqzV6TYaCEBfsezZLvq4EZkHOJw4FzGttNWC9AoDYNjI0q4
         MlKEjlh++/lTSH1Vj3fSw7O/DRAesvJp2dnwzr5O941MveDLV+xeD6ed1F5c/q9YyKM/
         nddNChPdJcjrUgEVgOoc13fS24BjvEuX+JjQQI94/EgCE6SwXtqGAhjFCEQ5Y5+9ieOT
         jscJobW4lCzV0gsvX6UpdNpRuGQF6RzgNe9bu1U2y2/qNVgG+ra6fsxUKmZtzZltJs8O
         OJJA==
X-Forwarded-Encrypted: i=1; AJvYcCUpRnyKw7gErTYrfywxoOiL3aASBqMyeVEn5VS128wgKrlbTtyD0hTKQYMN3kGzBu9vvYcUgBwcXBQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5SzdSP1bcdFigO4bmN2pOcIqOHbSzW8ywxJ6cmBakHmcfZJBr
	OZq0VIWyPNnvU79FSoW1UX1JTWMcf6dRu3j5G3YGO66iQ0g+ar1m
X-Gm-Gg: ASbGnct3NOpyAqmkWqdgpx8OlGtO+wfES97yGzmepqCJnCgGBE2wmF03RoSaAxOyUS3
	c+ntsMGrpifGoBj3wuVWLqCKTHkJXAWDCrPSxbpAB4moQh64LzMwfAs7utcm4sxIv0eBkZM1wVN
	m51fydN6kE6CLZQU5Y0lZfbEVyojm1puSotgMw2SstlYXYNwPgCISMNPlwTtV62qJ4d3UY11ddB
	A1LsZQJas1F+3NUq5LRpKBhEApx1TSFw38k5dOQH2BeC1F73StZ1GrMY22pJaJRHK9gQbMKLJC/
	NPjhXMRIrPC/z8rMeEPvACK5cprKLF6ZM6ca6xuL/zwy4IrMWyc=
X-Google-Smtp-Source: AGHT+IFBplIB7lbzzonBtacivuTbdfAuDOBFrLzj0CEeoRBndpxGhIacjgtf4O10nP956h0EjBOoEg==
X-Received: by 2002:a05:6a00:22c2:b0:736:5545:5b84 with SMTP id d2e1a72fcca58-73bafbbae8dmr4546648b3a.3.1744224066191;
        Wed, 09 Apr 2025 11:41:06 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e4f768sm1739807b3a.142.2025.04.09.11.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:41:05 -0700 (PDT)
Date: Wed, 9 Apr 2025 14:41:03 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org,
	joel@jms.id.au, eajames@linux.ibm.com, andrzej.hajda@intel.com,
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
	jirislaby@kernel.org, akpm@linux-foundation.org, jdelvare@suse.com,
	linux@roeck-us.net, alexandre.belloni@bootlin.com, pgaj@cadence.com,
	hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw, Frank.Li@nxp.com,
	linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org,
	david.laight.linux@gmail.com, andrew.cooper3@citrix.com,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v4 02/13] media: media/test_drivers: Replace open-coded
 parity calculation with parity_odd()
Message-ID: <Z_a_PzmNnvC2z7se@yury>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-3-visitorckw@gmail.com>
 <Z_aobrK3t7zdwZRK@yury>
 <Z/a7DecDljuLtKeS@visitorckw-System-Product-Name>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z/a7DecDljuLtKeS@visitorckw-System-Product-Name>

On Thu, Apr 10, 2025 at 02:23:09AM +0800, Kuan-Wei Chiu wrote:
> On Wed, Apr 09, 2025 at 01:03:42PM -0400, Yury Norov wrote:
> > On Wed, Apr 09, 2025 at 11:43:45PM +0800, Kuan-Wei Chiu wrote:
> > > Refactor parity calculations to use the standard parity_odd() helper.
> > > This change eliminates redundant implementations.
> > > 
> > > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > > ---
> > >  drivers/media/test-drivers/vivid/vivid-vbi-gen.c | 8 ++------
> > >  1 file changed, 2 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> > > index 70a4024d461e..5e1b7b1742e4 100644
> > > --- a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> > > +++ b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> > > @@ -5,6 +5,7 @@
> > >   * Copyright 2014 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
> > >   */
> > >  
> > > +#include <linux/bitops.h>
> > >  #include <linux/errno.h>
> > >  #include <linux/kernel.h>
> > >  #include <linux/ktime.h>
> > > @@ -165,12 +166,7 @@ static const u8 vivid_cc_sequence2[30] = {
> > >  
> > >  static u8 calc_parity(u8 val)
> > >  {
> > > -	unsigned i;
> > > -	unsigned tot = 0;
> > > -
> > > -	for (i = 0; i < 7; i++)
> > > -		tot += (val & (1 << i)) ? 1 : 0;
> > > -	return val | ((tot & 1) ? 0 : 0x80);
> > > +	return val | (parity_odd(val) ? 0 : 0x80);
> > 
> > So, if val == 0 than parity_odd(val) is also 0, and this can be
> > simplified just to:
> >         return parity(val) ? 0 : 0x80;
> > Or I miss something?
> >
> If val == 0x01, the return value of calc_parity() will remain 0x01.
> If changed to return parity_odd(val) ? 0 : 0x80;, the return value will
> be changed to 0x00.

Sorry, I meant
        return val ? 0 : 0x80;

This 'val | (parity_odd(val)' is only false when val == 0, right?
When val != 0, compiler will return true immediately, not even calling
parity().

I think we need a comment from authors.
