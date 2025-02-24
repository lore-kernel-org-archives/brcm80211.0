Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386921C8623
	for <brcm80211@lists.linux.dev>; Mon, 24 Feb 2025 22:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740435455; cv=none; b=Dyg8JlO9Lc/VKWN2ZlGdshI5bq9LC7/vMVO5NjxIVbj6kOCBh+jxmPU+Du0MGl1fk5zb9VcHcfzpc/fAxbEf7eTGZnxxa/uohOtaVXA2PI0RnAnObLIrHI6BpiHhmPJkE7eDxUCMRA5I16ovhTNsm14EriGSIJVchEp8+f4sUE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740435455; c=relaxed/simple;
	bh=fsXk7cQiXABl/mlEd5HYoSOLhw00DiL9RvUkyobxBIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=thjIdZyACJTJZb4lkwxVCtp+qsKJKZnpOBX83h1yhlFCO4o70V7DYpw0mrf4n1336CrJmpaRBTQpNR9a/TTYdVCu5ZYhRCJUo/VsgyEKgM99CrUshBmhsr8QlAJiHMsOrvtwZK0FEtpq1ZMvGVheGB6Q21Rfgr5Fb7kAEJ8Wz/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PVMGo/Oy; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PVMGo/Oy"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2210d92292eso148720185ad.1
        for <brcm80211@lists.linux.dev>; Mon, 24 Feb 2025 14:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740435453; x=1741040253; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MIAmGwREzfChZxhZrA3OzxmyUXhIuIWMIVivU3ALR/o=;
        b=PVMGo/Oyj+tfQIjBbJcvaDr6dJhLoRK5ssB1YBY7yTdWCO8KQKGDjcsQCL3NjAuTYs
         SbxUcIx/bJCyigm+Ynf62IpPhqHMPGZ1fAw8wON4EIdSDKjk8MD4d09fIKz3Ebk9i39a
         X0T6K7m2ZsF/mJ6KttSvolnxmOY7qdWzJBcY0Sx14a6+Ng2GAQ7ZTmv11zm1Cq+WeT50
         qys4AF96TdsCCPi9eojy6wdGUK+3xPm9qgPDb2AATuQQ9djozezRtvTQIn1vRuPdjJyB
         CDULeQj2MAb4QfG2WT4SCpjoKfpjRTx+Aax9PZhekWgGMlGqK//55SLYS3urf9nu7+Mj
         Qr5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740435453; x=1741040253;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MIAmGwREzfChZxhZrA3OzxmyUXhIuIWMIVivU3ALR/o=;
        b=k2AL/s+XnMMbVs4SNIXRMtWs1CfBraj7LwHNnxa4PJjKI+r2aZ8diX2mRF51gcpcK5
         jy+X4uDQZgpcEmhRCqBY9Wnf2dbJGT4WIq1V9hhCSBfreuMjEkS+B+vMd4Zwg9NwRlu6
         bhXCNTViRhS6W/cs2a9nN7QsMRlYNP9NBgdxduwOv5NVnR2GNe0rooV+Q/wMzpo9MJl0
         CBy588qaKDF/boe1taYYATKKGNjLxSwpCs2bqtFwiLwBTqYHaR7IlSUBOpq99z0aqoT1
         gFtWb6tWXf0CY2BBk0/XeIeM/N/lLqzTQcYsxyvlF3ErqWcVoc9wU/5/QMOp6zdqwmYB
         ht7g==
X-Forwarded-Encrypted: i=1; AJvYcCUaEkbSgMwTVtHGarUMdJW5DTQBqoDaFfigdcjnV1lJWCwqIB2oZySFD/qTs/iZBSUeWN3ck+IQEL0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxL9jAqkcejOTPLu33euzJ9yfN5w0oHMBeNXkwFTRdXMkN0U0RR
	EZtOne2nxLSZAAcWwtgYwLq28l/NOj3llpRkKFSHa/BIpxr74mQr
X-Gm-Gg: ASbGncvheOuGAjUZlBqWLgRIltwhPzRplFS6LHrrpnQbmwff+nCB09jbWye+epxM78a
	o7c1/RznbBHXB/53MdBsgOIKXgOninTVmUVMBlw2QBHM8q9TXKjWRz3l7YgnXKslkT0RjL2HhS9
	sM79USJJfn7v48LqgGquk16HVswAhLzcrNrMa63j52uvSSAMl9b+5n8jJ4sBfx64IzJkSsaRMe4
	Xw/moTu4P+V0MaZ1O6wDX/N9YGZDm4THGBl47RFUGq77BOBjEDnFf3MuAgF6Gz8QTbz4BNi9Qb5
	YVXwS0By93X9vzrgfjPzGbnk1Y2KvAFBGFKxe2y5+aeQ2ISacQ==
X-Google-Smtp-Source: AGHT+IHUNZzOI1ZFK/Wig2ECxEjG2LCeoTVF/IwXlP7H5EbtmMAu2d6RHqgduSyhdb+wHec1lfRRUA==
X-Received: by 2002:a17:903:2a8d:b0:21f:6584:2085 with SMTP id d9443c01a7336-2219ffc4928mr267486635ad.42.1740435452344;
        Mon, 24 Feb 2025 14:17:32 -0800 (PST)
Received: from localhost (maglev-oncall.nvidia.com. [216.228.125.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a01fe28sm1125415ad.100.2025.02.24.14.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 14:17:31 -0800 (PST)
Date: Mon, 24 Feb 2025 17:17:29 -0500
From: Yury Norov <yury.norov@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Uros Bizjak <ubizjak@gmail.com>, Kuan-Wei Chiu <visitorckw@gmail.com>,
	tglx@linutronix.de, Ingo Molnar <mingo@redhat.com>, bp@alien8.de,
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
	jirislaby@kernel.org, akpm@linux-foundation.org, mingo@kernel.org,
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
Subject: Re: [PATCH 03/17] x86: Replace open-coded parity calculation with
 parity8()
Message-ID: <Z7zv-c4A76jeMAKf@thinkpad>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-4-visitorckw@gmail.com>
 <d080a2d6-9ec7-1c86-4cf4-536400221f68@gmail.com>
 <e0b1c299-7f19-4453-a1ce-676068601213@zytor.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0b1c299-7f19-4453-a1ce-676068601213@zytor.com>

On Mon, Feb 24, 2025 at 01:55:28PM -0800, H. Peter Anvin wrote:
> On 2/24/25 07:24, Uros Bizjak wrote:
> > 
> > 
> > On 23. 02. 25 17:42, Kuan-Wei Chiu wrote:
> > > Refactor parity calculations to use the standard parity8() helper. This
> > > change eliminates redundant implementations and improves code
> > > efficiency.
> > 
> > The patch improves parity assembly code in bootflag.o from:
> > 
> >    58:    89 de                    mov    %ebx,%esi
> >    5a:    b9 08 00 00 00           mov    $0x8,%ecx
> >    5f:    31 d2                    xor    %edx,%edx
> >    61:    89 f0                    mov    %esi,%eax
> >    63:    89 d7                    mov    %edx,%edi
> >    65:    40 d0 ee                 shr    %sil
> >    68:    83 e0 01                 and    $0x1,%eax
> >    6b:    31 c2                    xor    %eax,%edx
> >    6d:    83 e9 01                 sub    $0x1,%ecx
> >    70:    75 ef                    jne    61 <sbf_init+0x51>
> >    72:    39 c7                    cmp    %eax,%edi
> >    74:    74 7f                    je     f5 <sbf_init+0xe5>
> >    76:
> > 
> > to:
> > 
> >    54:    89 d8                    mov    %ebx,%eax
> >    56:    ba 96 69 00 00           mov    $0x6996,%edx
> >    5b:    c0 e8 04                 shr    $0x4,%al
> >    5e:    31 d8                    xor    %ebx,%eax
> >    60:    83 e0 0f                 and    $0xf,%eax
> >    63:    0f a3 c2                 bt     %eax,%edx
> >    66:    73 64                    jae    cc <sbf_init+0xbc>
> >    68:
> > 
> > which is faster and smaller (-10 bytes) code.
> > 
> 
> Of course, on x86, parity8() and parity16() can be implemented very simply:
> 
> (Also, the parity functions really ought to return bool, and be flagged
> __attribute_const__.)

There was a discussion regarding return type when parity8() was added.
The integer type was taken over bool with a sort of consideration that
bool should be returned as an answer to some question, like parity_odd().

To me it's not a big deal. We can switch to boolean and describe in
comment what the 'true' means for the parity() function.
