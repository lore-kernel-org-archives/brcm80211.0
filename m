Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659571DDC3F
	for <brcm80211@lists.linux.dev>; Wed,  9 Apr 2025 19:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744226494; cv=none; b=q1spw47NfaDcYoNhYDkgPkfs0gJ7juFVsQb+JqlolrjmQ6E7z+920gsFCAAcWPvpRaxhOlpA34GACuWgXX8CkZsuB471Yeu6rKahwWn0ZkAz9oglPAHZeHI0lRsg8KUjaVxoI5bmpLiI4F+sQtT9ry2cdrJhNKfqllj5dsJH2UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744226494; c=relaxed/simple;
	bh=Hin3jaoZD2UKks89Cwi9KM4qtpbZXTlLg+tKDL12RxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gEagLegu9IpzeCnBiqVlYT3zhhaUYj94VFW7Y/Pfl1pLwChoGCicobozovAalPyEwQSqiXFpcZ5XCit0AIQNExwNtxRsP6C3QadRX26sQSM7bb+MH7693KBQu4UdGPzLu/A/3mAAWSm+Q8uuUBYReJkmK+vZQaVNNYgJ9egu5Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DT3gpAZi; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DT3gpAZi"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-739525d4e12so6603377b3a.3
        for <brcm80211@lists.linux.dev>; Wed, 09 Apr 2025 12:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744226493; x=1744831293; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+fSnm+LAeRoIOsICdxC6XJUJVWVyIvXXXOFvA8oRabs=;
        b=DT3gpAZinbWfwAxLRUjF9FVofaOLgeOT4XxrkmijeQ1StpWzCFCzvznb1L3zmHz0RV
         EmrSXaeZmCxAsJaT00iks3iGaK1JJ4Vt2+ty2T33jO6+Xc6lo8/nS/sSVltm8e4b0az9
         kkzFPfInFoqyh5FFTwtaJJbz64KquL68eTgy0N9cSpwYO8AJhpx9h+O7UiAZpFgTnyz/
         qszxGEe4eVOYWPl1AYqzYa5qLPjJIlgi2rPhATCxxWPgoHlqXAtQRAFQsSsxoQ4EC5tn
         XNEG9h4C6rUW7XVOclVV0aao8IwPsojnzDS+zRcLZM0aZLp89e1fbaDEP7n6aq18Ix+0
         JdSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744226493; x=1744831293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+fSnm+LAeRoIOsICdxC6XJUJVWVyIvXXXOFvA8oRabs=;
        b=EsbQuR+YEijbxSH9pkpYHbl6Zf2VAU066q+xEac3yINiJsP2CAAlAxMWP86kUJ9yoy
         BtkzC9nxocapTS25Q0megtDpdijD1LnGkNRgCJLkyFPPa4u+5xkC9mi/mYh2fFEiRVLY
         85ofawbsI7BkJEg0RYt2nd4c2gLn7wt4ZCf8Q+uFnQuq3nXT9vjFjh05kaMdfr2EYAzN
         u1nN8iz+yl/gh+WZakAlZqRd6QxerArQxvZyZQ2K5nbTfWY8XmxsvCoCz0IIQLg8dJBj
         DpZTCNrPCEeJZmJA+HPIpJUw5BdCy32+Z/68FtlJxARGH8SGSXbs76a3OCeDLuGIUhmT
         UapA==
X-Forwarded-Encrypted: i=1; AJvYcCV1bI6bOK7jnXu5IGo8oOF6MoPlHFhjWIIr3FiCARJSeuos/yRj64MB1M7IVTqCsdQuEd2WbalCwOo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwWooDrG7Lq+OAQyrtc8EzsozmtdIGT1AKtijJbDK9sRb3k0qs0
	9SH7iBhTf41Imm6FTIh0sy/+Qh7UvOBSR2XORo6YtVTtofZkzpNv
X-Gm-Gg: ASbGnctx5J0Is2x+Iddvy56ynCNOGrIdiZdKE5V+giNgLuUenqRQZgTEfSMn7mbgU45
	wbKSQGjD6q4sQHwME6m6l2QUE886aoYsM8d3uMBjHJhrtLElRx5Z/1OF2EICCXCqujGenMQUAbP
	UkhLJfaYujHdxyNP7/kqurcJ1GsePKSWoSNIMorLJc1DduYZLoPKMjjVaA7MyKtLSIB6LSLTRJ5
	g/G8XX6nAKhZyczywrOipMw+ZA76mH9XiahxL56+i7KBBhNiI0Bzsu+inMTzXe1Nz/3BTJnxJcf
	cYE3SW+ByYP0AoMuaLE5kiO3B6WM+gTgY95tx+0mOR+gVcroERwd4eyZTwDpHiS8Lt9Q
X-Google-Smtp-Source: AGHT+IHAXQm8yqDVRx3hUkKcG0uQQDMrqQOD2SeunqXbiHMcL37CayQuCVkU18t9V7SBUxyy5kmIoQ==
X-Received: by 2002:a05:6a20:9c89:b0:1f5:873b:3d32 with SMTP id adf61e73a8af0-201695fb36dmr272504637.39.1744226492588;
        Wed, 09 Apr 2025 12:21:32 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e69376sm1726443b3a.165.2025.04.09.12.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 12:21:32 -0700 (PDT)
Date: Thu, 10 Apr 2025 03:21:21 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Yury Norov <yury.norov@gmail.com>
Cc: Yury Norov <yury.norov@gmail.com>, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	jk@ozlabs.org, joel@jms.id.au, eajames@linux.ibm.com,
	andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	rfoss@kernel.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, dmitry.torokhov@gmail.com, mchehab@kernel.org,
	awalls@md.metrocast.net, hverkuil@xs4all.nl,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	louis.peens@corigine.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
	johannes@sipsolutions.net, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, akpm@linux-foundation.org, jdelvare@suse.com,
	alexandre.belloni@bootlin.com, pgaj@cadence.com, hpa@zytor.com,
	alistair@popple.id.au, linux@rasmusvillemoes.dk,
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
Subject: Re: [PATCH v4 01/13] bitops: Change parity8() to parity_odd() with
 u64 input and bool return type
Message-ID: <Z/bIsT7RT1C7rGYC@visitorckw-System-Product-Name>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-2-visitorckw@gmail.com>
 <Z_anYpZw_E8ehN21@yury>
 <Z/a7t1yATUXn11vD@visitorckw-System-Product-Name>
 <315b4c75-a596-4509-99f7-921ebda2fed9@roeck-us.net>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <315b4c75-a596-4509-99f7-921ebda2fed9@roeck-us.net>

On Wed, Apr 09, 2025 at 11:39:22AM -0700, Guenter Roeck wrote:
> On 4/9/25 11:25, Kuan-Wei Chiu wrote:
> > On Wed, Apr 09, 2025 at 12:59:14PM -0400, Yury Norov wrote:
> > > On Wed, Apr 09, 2025 at 11:43:44PM +0800, Kuan-Wei Chiu wrote:
> > > > Redesign the parity8() helper as parity_odd(), changing its input type
> > > > from u8 to u64 to support broader use cases and its return type from
> > > > int to bool to clearly reflect the function's binary output. The
> > > > function now returns true for odd parity and false for even parity,
> > > > making its behavior more intuitive based on the name.
> > > > 
> > > > Also mark the function with __attribute_const__ to enable better
> > > > compiler optimization, as the result depends solely on its input and
> > > > has no side effects.
> > > > 
> > > > While more efficient implementations may exist, further optimization is
> > > > postponed until a use case in performance-critical paths arises.
> > > > 
> > > > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > > > ---
> > > >   arch/x86/kernel/bootflag.c               |  4 ++--
> > > >   drivers/hwmon/spd5118.c                  |  2 +-
> > > >   drivers/i3c/master/dw-i3c-master.c       |  2 +-
> > > >   drivers/i3c/master/i3c-master-cdns.c     |  2 +-
> > > >   drivers/i3c/master/mipi-i3c-hci/dat_v1.c |  2 +-
> > > >   include/linux/bitops.h                   | 19 ++++++++++++-------
> > > >   6 files changed, 18 insertions(+), 13 deletions(-)
> > > > 
> > > > diff --git a/arch/x86/kernel/bootflag.c b/arch/x86/kernel/bootflag.c
> > > > index 73274d76ce16..86aae4b2bfd5 100644
> > > > --- a/arch/x86/kernel/bootflag.c
> > > > +++ b/arch/x86/kernel/bootflag.c
> > > > @@ -26,7 +26,7 @@ static void __init sbf_write(u8 v)
> > > >   	unsigned long flags;
> > > >   	if (sbf_port != -1) {
> > > > -		if (!parity8(v))
> > > > +		if (!parity_odd(v))
> 
> What is the benefit of this change all over the place instead of
> adding parity_odd() as new API and keeping the old one (just letting
> it call the new API) ?
> 
> A simple
> 
> static inline int parity8(u8 val)
> {
> 	return parity_odd(val);
> }
> 
> would have done the trick and be much less invasive.
> 
Yury has previously mentioned that adding multiple fixed-type parity
functions increases his maintenance burden. IIUC, he prefers having a
single interface in bitops.h rather than multiple ones.

He were reluctant to add three more functions like:

static inline bool parity16(u16 val)
{
    return parity8(val ^ (val >> 8));
}

static inline bool parity32(u32 val)
{
    return parity16(val ^ (val >> 16));
}

static inline bool parity64(u64 val)
{
    return parity32(val ^ (val >> 32));
}

But instead, we ended up with:

static inline bool parity(u64 val)
{
    val ^= val >> 32;
	val ^= val >> 16;
	val ^= val >> 8;
	val ^= val >> 4;
	return (0x6996 >> (val & 0xf)) & 1;
}

static inline bool parity8(u8 val)
{
    return parity_odd(val);
}

But in the end, we introduced both parity(u64) and parity8(u8), which,
IMHO, might be even more confusing than having consistent fixed-type
helpers.

Regards,
Kuan-Wei

