Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C0922A4E2
	for <brcm80211@lists.linux.dev>; Wed, 26 Feb 2025 17:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740592797; cv=none; b=KmHLKtiamfsGfgZOjL5QpclWAFOb8Pcv7UkYqLXFi1kGWzGHV/tTwJ6WbhHMV64pgY27uyNz+tHERnwA5qrvwdCBM20BKwCNjT54j5CgzKVkYbx8fafeUjBy6lnVVeGvk01Mgc+fzN/1MEN8NQbCuTdAchKYGZFw3AiUDSSh+Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740592797; c=relaxed/simple;
	bh=NgL7kzU8DCxs2aqncslIBjrb2AeIRzc4rI9CzlkoJnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JhMuEReKCO3skQuUK5XriM1CQFkBK7WxSmL7gee5rVzI3FpDwRYIE10ZaobqlB9ToZi7yLxvueCpmLdkU332UdxHxVnle6Edfaz+RQ0GPm/jHVFWoOISshnuyW66Cf8+w7SVFG0JRHQBJNU3naQFPvIbu818966X0KF4jOdhvHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQ/vecSe; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQ/vecSe"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22128b7d587so369015ad.3
        for <brcm80211@lists.linux.dev>; Wed, 26 Feb 2025 09:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740592795; x=1741197595; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aLZRzBzitap92yZk251lvU9DytAtAlhsYa/CQwhvV8Q=;
        b=DQ/vecSeOeCGEgXzpC5Ih7SBJ0Eyn+d+QQcZ6mI0GtTrQYWWcod1r1jdSECQ8u3yTs
         B7t/SGHnk1TVxqYE0gHxFhxJt4YoZ/jZUz092RcL9N0sDe6NSQ+TPbDM+TVYLL7yqUW1
         5oqHEu75aljvPrhaXtd7bPDktiQ9mh6DHBvb/wW3CCZroiftmyNrO7C4GZAPk9QKtLsX
         VPp8s96SUKoSLDpTQ2nSPwZ8eDOxV7r3qjqp/sCq0YlXUXPv4ubT3So67lEDggi1TBLr
         x/1NM5MFknWh5JA+agqE4dB12NLKNAtaqAEwFrByGmbtOS4BybqzBLsCystplUPGYrxJ
         j+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740592795; x=1741197595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLZRzBzitap92yZk251lvU9DytAtAlhsYa/CQwhvV8Q=;
        b=vopSVP4PhYLLYv0S30+AHUEvqHJFxD1NMTqzFZ07cLS7P4edNpwP9GzDHUZxsK+nlc
         6oLlQdSWyguVSo/09VkvKGoLy1NFZw+Ly3ZOcuULMhYoyS4pRVhPU3PcIK9c8Xy95jg5
         TrqUhA1W4mu9oi66WalngWT3MbIU0Ywkk1qEafY2waa5kmLMCljhDh0uUPIz8mSr5r24
         Kr1gGTovE7OiC1WyWlHXv8G4YXygjZMDDaV7d6VgVwlzdd512n9qrc03sQiy08Ig7QOp
         DQ8ellb1j3M6zszoC4/QK6/mHLnA7dl6lA712rD2eDWQO2wk51hujkJ0Qmt4bcmRBzH1
         SNvw==
X-Forwarded-Encrypted: i=1; AJvYcCXvw2Nb2Chy7DYElxS5CCrp2KVSWiWXbvOnaOgXKEFsnCdnS41TMzWPfInhRIB60UkwuaWRRDz1hE4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxUu8f0YDmuQQ6bsaLnLzxjP+oPDux3PX/eQ615AlNwTfW9CZK7
	s2bywrcTkTcJrtiaBVj/uJiFuZNUqZVjR33wXJcg27l1ZieTBRxt
X-Gm-Gg: ASbGncuAo0s39wfg0QOmWIJXE6nJGfMXX0VE6aRXHP74Rxj7GQvw2ACnoTvvRzp/eIu
	/pxXlDQCkMWtIQhVqHeZc6gM+AxPsoDhfSfaPqVgqPILAa+yPh20w660tHtoTd3x2N4ES1zAQGy
	PAIUoHczW/rYsWi5kKdee8Sz/18UIvoWaUlGFNfumWlQJ+KRlJjT5a8G7RxgJyJF1Cn9QumwQDa
	/LjEiZdXBL7F3xgHdtO3I1WQsiv4kkHHUk4aaHrTSVqvg4eBKYnkI0QKPjV4Im4+Tw9PuqIRLca
	Rbp7cK/F2t8eHfOHw7S2yXjWbEU+UiHJzWRJ0vp+u2UYJYZOD21QVA==
X-Google-Smtp-Source: AGHT+IFPX6/YemPi/DqumfrbMAfmVM+yJTxaN3xhdxU4AjgnAZPzxKGRLUd3gIiPdvk59fs7FScnAQ==
X-Received: by 2002:a05:6a21:600c:b0:1ee:c74c:2436 with SMTP id adf61e73a8af0-1f10ae2ec90mr8029040637.34.1740592795469;
        Wed, 26 Feb 2025 09:59:55 -0800 (PST)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aedaab2e8fbsm3541850a12.64.2025.02.26.09.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 09:59:54 -0800 (PST)
Date: Thu, 27 Feb 2025 01:59:44 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Jiri Slaby <jirislaby@kernel.org>
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
	akpm@linux-foundation.org, hpa@zytor.com, alistair@popple.id.au,
	linux@rasmusvillemoes.dk, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH 02/17] bitops: Add generic parity calculation for u64
Message-ID: <Z79WkNp6p06fV/f9@visitorckw-System-Product-Name>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-3-visitorckw@gmail.com>
 <Z7zIBwH4aUA7G9MY@thinkpad>
 <Z73FxIv353lbXO3A@visitorckw-System-Product-Name>
 <b5236ae4-7ebe-4a88-bbc9-3b9b3374de53@kernel.org>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5236ae4-7ebe-4a88-bbc9-3b9b3374de53@kernel.org>

Hi Jiri,

On Wed, Feb 26, 2025 at 08:14:14AM +0100, Jiri Slaby wrote:
> On 25. 02. 25, 14:29, Kuan-Wei Chiu wrote:
> > > +#define parity(val)					\
> > > +({							\
> > > +	u64 __v = (val);				\
> > > +	int __ret;					\
> > > +	switch (BITS_PER_TYPE(val)) {			\
> > > +	case 64:					\
> > > +		__v ^= __v >> 32;			\
> > > +		fallthrough;				\
> > > +	case 32:					\
> > > +		__v ^= __v >> 16;			\
> > > +		fallthrough;				\
> > > +	case 16:					\
> > > +		__v ^= __v >> 8;			\
> > > +		fallthrough;				\
> > > +	case 8:						\
> > > +		__v ^= __v >> 4;			\
> > > +		__ret =  (0x6996 >> (__v & 0xf)) & 1;	\
> > > +		break;					\
> > > +	default:					\
> > > +		BUILD_BUG();				\
> > > +	}						\
> > > +	__ret;						\
> > > +})
> > > +
> > > +#define parity8(val)	parity((u8)(val))
> > > +#define parity32(val)	parity((u32)(val))
> > > +#define parity64(val)	parity((u64)(val))
> > What do you think about using these inline functions instead of macros?
> > Except for parity8(), each function is a single line and follows the
> > same logic. I find inline functions more readable, and coding-style.rst
> > also recommends them over macros.
> 
> Not in cases where macros are inevitable. I mean, do we need parityXX() for
> XX in (8, 16, 32, 64) at all? Isn't the parity() above enough for everybody?
> And if not, you can have all those parityXX() as inlines as you suggest, but
> also provide a macro such as the above to call (optimized) parityXX() as per
> datatype len.
> 
I agree that we can add a macro to call parity8/16/32/64 based on the
data type size. However, I think we should still keep parity8/16/32/64.
As Peter and David discussed, the x86-specific implementations of
parity8() and parity16() might use different instructions instead of
just XORing and calling another function, as in the generic version.

My current idea is to follow David's suggestion and use
__builtin_parity when there is no architecture-specific implementation.
In lib/, we can provide a generic weak function implementation of
__parity[sdt]i2.

Any comments or suggestions are welcome!

Regards,
Kuan-Wei

static inline parity32(u32 val)
{
    return __builtin_const_p(val) ? _parity_const(val) : _parity32(val);
}

#ifndef _parity32
static inline _parity32(u32 val)
{
    return __builtin_parity(val);
}
#endif

int __weak __paritysi2(u32 val);
int __weak __paritysi2(u32 val)
{
    val ^= val >> 16;
    val ^= val >> 8;
    val ^= val >> 4;
    return (0x6996 >> (val & 0xf)) & 1;
}
EXPORT_SYMBOL(__paritysi2);
