Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D933625D8E1
	for <brcm80211@lists.linux.dev>; Wed, 26 Feb 2025 22:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740608957; cv=none; b=t+4GBCUfplW1YZXTld7L0i26fB/v7XjUt9o+VUytEe/1OALYJlrWcYdwglCqEwlC68w5RqdjHZ8BJoxErqGYW29cjrh45iszdsBcHq+oJrPVaMmN9uttHKc+sdW712PRjdcCtqV4tqJwiWNH/BZ5RWIhrQAOKkDzzmCRILjfumw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740608957; c=relaxed/simple;
	bh=WHPKx1WninINjpWP2dwg3Iq53rxsjrVAY5O3XcMBM0U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TCPLfDLRaxCTSy/860u2wv6qGgJWan4mgbY8VQCLwOiEdTrn1ndHbyN04C6IiZEkUbnCHrH5LFahsk9eAqg+m0b8nbrt8Wo77LfEvV1TvBon3JSkKM7AzP9bYRXaZ2r2rR9nVveUnmA+rKb7aQ2P6Y5+bOTjL5+RTCgL/p5ECsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d34hwSAM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d34hwSAM"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-439ac3216dcso2198235e9.1
        for <brcm80211@lists.linux.dev>; Wed, 26 Feb 2025 14:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740608954; x=1741213754; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TfWwQBkEse5FRQekJZuNar17CRdvAyTkX7+fO0J+m/4=;
        b=d34hwSAM4ZIsTJDiIZnDavpfAyNVI5VepLU4qqIodf50GvIoUv9NXZLKjN/YACglne
         +5IpPv6D5qXbRR69/H8LbsG18DSxHSNGH3EAoQwwmLclpIDFTtJucoGh6nMLOyaLdxJz
         M46kudBNaHCb1jEfRPzFKbUbuYPlt7b1eU3wMzDPT/VsiId6zboQiivdHeqRW7gioWPM
         UeCf0ReSM247cd3xmE3s5Bwx8e95KnlBRhDVv1v0dq20NTPrnUbrrtPgNBUBehqC3llK
         BhmVZERCiAMvkhQJzeyw4hHA3kR2zT/AKjPhmEbwQKhLOtT5qPfW1TRB8TAqd+Re2tE4
         hwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740608954; x=1741213754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TfWwQBkEse5FRQekJZuNar17CRdvAyTkX7+fO0J+m/4=;
        b=YT09GmX1MTTpExUttlVVtR71Mr96jxlbsMWstTM5WF3NXlGOg0zBqlkNZAaUOgayBh
         /tPGbxtSgL9pO2XqSWhMm5BgzpUUaNLtHLebneb6l3BnrIU5rdZoGo/0BL8D+nJDoyYV
         vH023LTw1Z6LmWNhmNtDnAE8DHBsT0+3+fEflRKLuw5tmp7ln9TcwRV20RjIhml9tfUF
         ObcQ8k8In5j5frRKLfq7q5vzZEttX8BlMmxJc8GNJNGoR6ImfSp8WNAjg5K0RqlJD6wq
         pB/wt67vs2VP+8fCHr2mTfkoX/BGyyQjSsmkOn+JXhTsuDheJN5SjRfGrXyxLq1W16ni
         rZkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmUA7L27Z2/JuVpY1i3fojyMrjSsrMEns54v11yF5i1Df7BIEQ79F4BZm/06V1i5G7bMAExtrPOkY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4kwfSMcYmUGzD7qCYjBsGWUNrcwemU8z9cZUxg0Uvgwe17bxv
	es8FoYd5KeZL8XSHPkxTQPuhfxzRswyb2NV8ry1OcsaUHZ1d2WAC
X-Gm-Gg: ASbGncvP+kkiv/3mrb6b03Ymz8Lrdwqw7wYpuPPQPAFOwcsBvU0smZ4MrBkK/t4JloF
	X0E0orXR9MeaMcstwEL5ib5KwxHw4TLOu/5pSs30tEBog0cH5QmAJGbS4awWXKTooZ/sWU7BX/f
	Elr0xrXhIrWfUuYCuObWO/np3stBmF5DyrJB2B+zztV3sqe0w8OMkYCpUbE9ngP2ktuzsEny/Vv
	aRVSPXm01qCE+hgJ9PfCi2kkcUvSdSO4j10MzVaWiVgb2D9ALdMA9/ygaIZx8J+4Jmy0PW5bMN6
	J4uoi6M54GhWLF4OTvXwolAWSxCc47296Fxpfa59JNIsPhAaBI7Zo2pz2Iz6Zfgs
X-Google-Smtp-Source: AGHT+IGOLpw4Ro1gZlLbKLPuJeugBpGxKDyhpAzWxjxf7AIm0WuOoMev7XCdFdyak+Spbs3OpN2AOA==
X-Received: by 2002:a05:600c:4f47:b0:439:9828:c42c with SMTP id 5b1f17b1804b1-439aebc27cfmr188697005e9.23.1740608953906;
        Wed, 26 Feb 2025 14:29:13 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ab37403cfsm55655745e9.1.2025.02.26.14.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 14:29:13 -0800 (PST)
Date: Wed, 26 Feb 2025 22:29:11 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, jk@ozlabs.org, joel@jms.id.au, eajames@linux.ibm.com,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dmitry.torokhov@gmail.com,
 mchehab@kernel.org, awalls@md.metrocast.net, hverkuil@xs4all.nl,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 louis.peens@corigine.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, akpm@linux-foundation.org, hpa@zytor.com,
 alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH 02/17] bitops: Add generic parity calculation for u64
Message-ID: <20250226222911.22cb0c18@pumpkin>
In-Reply-To: <Z7zIBwH4aUA7G9MY@thinkpad>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
	<20250223164217.2139331-3-visitorckw@gmail.com>
	<Z7zIBwH4aUA7G9MY@thinkpad>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 24 Feb 2025 14:27:03 -0500
Yury Norov <yury.norov@gmail.com> wrote:
....
> +#define parity(val)					\
> +({							\
> +	u64 __v = (val);				\
> +	int __ret;					\
> +	switch (BITS_PER_TYPE(val)) {			\
> +	case 64:					\
> +		__v ^= __v >> 32;			\
> +		fallthrough;				\
> +	case 32:					\
> +		__v ^= __v >> 16;			\
> +		fallthrough;				\
> +	case 16:					\
> +		__v ^= __v >> 8;			\
> +		fallthrough;				\
> +	case 8:						\
> +		__v ^= __v >> 4;			\
> +		__ret =  (0x6996 >> (__v & 0xf)) & 1;	\
> +		break;					\
> +	default:					\
> +		BUILD_BUG();				\
> +	}						\
> +	__ret;						\
> +})
> +

You really don't want to do that!
gcc makes a right hash of it for x86 (32bit).
See https://www.godbolt.org/z/jG8dv3cvs

You do better using a __v32 after the 64bit xor.

Even the 64bit version is probably sub-optimal (both gcc and clang).
The whole lot ends up being a bit single register dependency chain.
You want to do:
	mov %eax, %edx
	shrl $n, %eax
	xor %edx, %eax
so that the 'mov' and 'shrl' can happen in the same clock
(without relying on the register-register move being optimised out).

I dropped in the arm64 for an example of where the magic shift of 6996
just adds an extra instruction.

	David


