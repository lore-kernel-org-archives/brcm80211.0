Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E832C24C08A
	for <brcm80211@lists.linux.dev>; Thu,  3 Apr 2025 14:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743691157; cv=none; b=U5pCCqttySD/2oZQ8mR04QC+AmwVmu8Z8S97rQ2Mw3C6FL7yrXnjmxonkibSZkM1H7A3cZ5t2wgse8KIkybxho+Lif2Rm+1wySlYxBR5RoVBgqpAR3iCwK/E1rcucJoPpcy0i+eo8rsrKTi2voiENb1+e/ynbTuZelBZf4uSK1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743691157; c=relaxed/simple;
	bh=dmX8ClR6s2gT1VOXeNIIzH890lXaEbUlMlb3oILAje8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IBwfeOS4YfngygK02SN5AACj7zftNNAQval20PsfpjWo/0fc5KH/p/zqY0yDFuS24gnGHEuLnJLNzwww/bk/f9WBDWLFxyzCz1VWGy3nmvxRejO/gqjvU6QJ8bLao143GSaitXSU7lcQNA/bQLGu0EUyoXP88pLmITwH4CbdTlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jNbbHsLU; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNbbHsLU"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-739be717eddso797428b3a.2
        for <brcm80211@lists.linux.dev>; Thu, 03 Apr 2025 07:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743691155; x=1744295955; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rvr0XxDHh05/lDdFnQkqZ5aBAiK03CfkHR41QzNZGHs=;
        b=jNbbHsLUXZkEMpeHan5Pw7U+nv36CEJOqU2xBqzfTjsUW97KHFz3z3gup3zP2pHGll
         idA9gkvCCKR32UctaC1UUczBYePtVsJJ6BLi7JMoNqo3VftxlgOQ+wTvCpADrVlJR14E
         ifMGya1wvcHfPWlRpth/gYZSIK7zMXgO+T7mYtsLI9YDc/1/URRUaJeYn2g1PRzIDdxU
         WOCnMEGxnKUhu2DSxrqaq+LIQRupsSBCtQzdxwAa24kfiGGKSBhl28+Dy8vFtssNKa3Y
         UD2JIcbrVX9LeuRjEHYSyeorJ1MYCBPqF2LTcLvGFoM/EuF/yRxmayZW2dXjq3AfCUGn
         iehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743691155; x=1744295955;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rvr0XxDHh05/lDdFnQkqZ5aBAiK03CfkHR41QzNZGHs=;
        b=SX+FVga8aKeEm6fJNe210EgFfvpDFAHll6GXa7dbG6IA8NBh2wQ5C6ghVY6c4G3Y3Z
         DI7Xt7IXYfFChkgx6Vw97sv/TJMIeI4TofDMSMxs/uKC9+5mjArBAWe6wzH0F0DP5yzV
         LH9LbNX5fpRUH5vBLM3yWHOAMs1b5Lf745xaAFdlPlYet+jC9I6NEJSNveRF2CyV5GhB
         ITTF5CBdlLt8kXa9yYL6yMBYPxTFJbojN6C/nLfabm4M4AZ/K+FJJsSe/6j9DVFCV9lY
         +N1ZD4vTpReYk6yAiZ2dZNQ7CAX0KIw/MZ3iVrSXpKrGavnqeJPIOKQZosmIQ+UVAaFN
         hQcw==
X-Forwarded-Encrypted: i=1; AJvYcCUgFBHQpBfzPkL3b7fA0DBl1nvMd/HGO2WMlpjZRvfBGZrj0Iy36Zr9Smd6P3/1NIb7TA+96Q3SEb4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwBB/Nb3rbPLKMmwSqwM/sUGuecmm9w2uaMdUyfc20A2SYUJHSv
	frq1dQvX/c+NcZHzjn333SLoqLwjuf+1z3wD5sJFRj64k95+xj0r
X-Gm-Gg: ASbGncuUcPNO2vpxBBQPrptukDgzYsqWbFqUzQwWQlZwKLYxf3hNVIIm9hHCJpGTc94
	ibsEpch2jko48wSLn1pUhPzaJuGvV0ro4unFvmA0/5LW6bwR4xKb7sX/y6b6UbAWju6TGLc/p3z
	pglloV1dtwL7RZtYvXD1V+IHkD1+obtGyH1XGgKWcIkB2NivyK6qjM4EKiFW6nrzp/V375ED+Z0
	QPgNvJNP3KzExUbHPw4+BRRl+qRrnm/nv064qdRb/MsLhTHnnMr/vE0lGZfeKKdVUk6TQeiXXIP
	WLk+aawmruVMLNAwdMMyCLarlr2KOG5uGWqPfCC87y8QY7T5q2udoYLbOf9w8Qln8p3uKEMj
X-Google-Smtp-Source: AGHT+IEBLhxF2I4CcVDE0Ip1aaBG/9qxfajK2d8loqdQY51JgxIHQayN0kr/iRs9O5E0K4MztoDo5g==
X-Received: by 2002:a05:6a20:6f04:b0:1fd:e9c8:cf3b with SMTP id adf61e73a8af0-200e4cc69c1mr11499641637.30.1743691154910;
        Thu, 03 Apr 2025 07:39:14 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc2d331csm1285435a12.12.2025.04.03.07.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 07:39:13 -0700 (PDT)
Date: Thu, 3 Apr 2025 22:39:03 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>, Yury Norov <yury.norov@gmail.com>
Cc: Yury Norov <yury.norov@gmail.com>,
	David Laight <david.laight.linux@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
	akpm@linux-foundation.org, alistair@popple.id.au,
	andrew+netdev@lunn.ch, andrzej.hajda@intel.com,
	arend.vanspriel@broadcom.com, awalls@md.metrocast.net, bp@alien8.de,
	bpf@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev, dave.hansen@linux.intel.com,
	davem@davemloft.net, dmitry.torokhov@gmail.com,
	dri-devel@lists.freedesktop.org, eajames@linux.ibm.com,
	edumazet@google.com, eleanor15x@gmail.com,
	gregkh@linuxfoundation.org, hverkuil@xs4all.nl,
	jernej.skrabec@gmail.com, jirislaby@kernel.org, jk@ozlabs.org,
	joel@jms.id.au, johannes@sipsolutions.net, jonas@kwiboo.se,
	jserv@ccns.ncku.edu.tw, kuba@kernel.org, linux-fsi@lists.ozlabs.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-serial@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux@rasmusvillemoes.dk, louis.peens@corigine.com,
	maarten.lankhorst@linux.intel.com, mchehab@kernel.org,
	mingo@redhat.com, miquel.raynal@bootlin.com, mripard@kernel.org,
	neil.armstrong@linaro.org, netdev@vger.kernel.org,
	oss-drivers@corigine.com, pabeni@redhat.com,
	parthiban.veerasooran@microchip.com, rfoss@kernel.org,
	richard@nod.at, simona@ffwll.ch, tglx@linutronix.de,
	tzimmermann@suse.de, vigneshr@ti.com, x86@kernel.org
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
Message-ID: <Z+6dh1ZVIKWWOKaP@visitorckw-System-Product-Name>
References: <20250307195310.58abff8c@pumpkin>
 <EB85C3C1-8A0D-4CB9-B501-BFEABDF3E977@zytor.com>
 <Z824SgB9Dt5zdWYc@visitorckw-System-Product-Name>
 <Z9CyuowYsZyez36c@thinkpad>
 <80771542-476C-493E-858A-D2AF6A355CC1@zytor.com>
 <Z9GtcNJie8TRKywZ@thinkpad>
 <Z9G2Tyypb3iLoBjn@visitorckw-System-Product-Name>
 <Z9KMKwnZXA2mkD2s@visitorckw-System-Product-Name>
 <Z+AlyB461xwMxMtG@visitorckw-System-Product-Name>
 <eec0dfd7-5e4f-4a08-928c-b7714dbc4a17@zytor.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eec0dfd7-5e4f-4a08-928c-b7714dbc4a17@zytor.com>

On Tue, Mar 25, 2025 at 12:43:25PM -0700, H. Peter Anvin wrote:
> On 3/23/25 08:16, Kuan-Wei Chiu wrote:
> > 
> > Interface 3: Multiple Functions
> > Description: bool parity_odd8/16/32/64()
> > Pros: No need for explicit casting; easy to integrate
> >        architecture-specific optimizations; except for parity8(), all
> >        functions are one-liners with no significant code duplication
> > Cons: More functions may increase maintenance burden
> > Opinions: Only I support this approach
> > 
> 
> OK, so I responded to this but I can't find my reply or any of the
> followups, so let me go again:
> 
> I prefer this option, because:
> 
> a. Virtually all uses of parity is done in contexts where the sizes of the
> items for which parity is to be taken are well-defined, but it is *really*
> easy for integer promotion to cause a value to be extended to 32 bits
> unnecessarily (sign or zero extend, although for parity it doesn't make any
> difference -- if the compiler realizes it.)
> 
> b. It makes it easier to add arch-specific implementations, notably using
> __builtin_parity on architectures where that is known to generate good code.
> 
> c. For architectures where only *some* parity implementations are
> fast/practical, the generic fallbacks will either naturally synthesize them
> from components via shift-xor, or they can be defined to use a larger
> version; the function prototype acts like a cast.
> 
> d. If there is a reason in the future to add a generic version, it is really
> easy to do using the size-specific functions as components; this is
> something we do literally all over the place, using a pattern so common that
> it, itself, probably should be macroized:
> 
> #define parity(x) 				\
> ({						\
> 	typeof(x) __x = (x);			\
> 	bool __y;				\
> 	switch (sizeof(__x)) {			\
> 		case 1:				\
> 			__y = parity8(__x);	\
> 			break;			\
> 		case 2:				\
> 			__y = parity16(__x);	\
> 			break;			\
> 		case 4:				\
> 			__y = parity32(__x);	\
> 			break;			\
> 		case 8:				\
> 			__y = parity64(__x);	\
> 			break;			\
> 		default:			\
> 			BUILD_BUG();		\
> 			break;			\
> 	}					\
> 	__y;					\
> })
>
Thank you for your detailed response and for explaining the rationale
behind your preference. The points you outlined in (a)–(d) all seem
quite reasonable to me.

Yury,
do you have any feedback on this?
Thank you.

Regards,
Kuan-Wei

