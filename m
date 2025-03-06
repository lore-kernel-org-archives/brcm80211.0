Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736892907
	for <brcm80211@lists.linux.dev>; Thu,  6 Mar 2025 20:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741293950; cv=none; b=dr2bcdt3klI+pe8xA6i5Aa+UrOi2AX1vLETyKX+MPq4dkPfj5Hyab3SjSz0fwWMPnpj5xaYywxszs9g8Cqi9AB6eBnNvtHjiELWC/owzIIevUqwXNYi4KzzpLMDCjD2R/kPtfCeUvSnx65TTSnQu7zWzcCSQt4Zps+XvyG0ptns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741293950; c=relaxed/simple;
	bh=YRiEklZgyKif9YQuFPeDNCuPRKOpVl4Sp4NBuCatdYk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EqdfaPhY605s4c6GqFcl/zo0MjHxNNOqB426UKNjTnw9V2K9ivq5XtcBYGh7xcW5b53IoBsy7jESaXPkT9am8zzlxDZi+32fsNKMqt8MpVrrpuRf6y1jQGxvO8kqLTAn/WxeBm8NR3n3ybrVonMpMz+B3mue2lvNJKMlffuRzB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=llzrG1pN; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="llzrG1pN"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39129fc51f8so1023753f8f.0
        for <brcm80211@lists.linux.dev>; Thu, 06 Mar 2025 12:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741293947; x=1741898747; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/2AW/XQ+C1Dkr/bifBKVXkd3UKdww00iQvvrQ69JSo=;
        b=llzrG1pN6v7IRXZJQVKK7N6SpdXfa3cionXW1/ATaSo2utm4Wv7H5l9cfRKPRh2fng
         1IdJfcTuLV1IfXML6JoVfci/vsXwXZ0hE2CpqITOFaTuhUNeXmAw471k7eBlbx7m3bRW
         7W6RrXT/Slt6H+c3n5vsh60ZCRLeaitvG9S8LtmQGFndCH97CQhIo0X7lNk0rCdhYxms
         eEj9sO1y9SxywY5iE7OVi1D1ip25ZD3FBVmfAnILfKcn6QCUFTkN1NJz/PZdV7UV/cCi
         jWEJ1RaMKa8vqVLuHLDze7KqXjC2AAUmkMU1gZCZlrP6OKHkkb6f1aLO9Ib5GseqZgvm
         U7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741293947; x=1741898747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/2AW/XQ+C1Dkr/bifBKVXkd3UKdww00iQvvrQ69JSo=;
        b=fweZz1EqVkY9a62SckCW/VoZqcyzaoxMDtcvcokYJU1uy7gvqZsmkbax+CyEFjQuk3
         abYVFkhPvye4QrRzfsfF5xlktn/t0eD9E0emlH4IVDcKSIDY/uCdi9FyZavxU6YL7ssC
         m32KJ7o/ByqBva36g1KiScV68E7ctqnXNPN1IyRSEMfyC2bAsW1Mu8xQ564jkJl277bR
         DmrUXoewAkn3lge8BieXAT6pzmmHPnxWMjEi6GKm/oS9QbQmVhhAaYxfpQrLBKfQdbDy
         zY3x+AzpI961yrFapRnoQlDvqb2WzgFEozfbbNNMXk/9IQQ84hb4YWjfGcQItwJDgeY0
         gAjg==
X-Forwarded-Encrypted: i=1; AJvYcCV83b9LDHRoY3Zwnij5m2csb1XrMWmm/kAwcMc6ioWbRkJnjszuKmAdePPioM0IdpIxQxOZQ4IVGtk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyazYX7E9LuQ2VlvkQjcLz9nF3mr8NCxiPBDRUyzfoqaX54BbpA
	g23PcSYcM1H3md39zlFoPiYDDPPAqJeR/vvlkkTc1pOyPl2njYYD
X-Gm-Gg: ASbGncs4P2P1CX0oQhxQmlpczmCX/rWzSdnXGE4AcgCNhAP7eWAWXNKKyV2vvEU4BuF
	Pk3U2XzHRDQqTlag7sDd9ZsUlIXDXYipoouMe1SeKNAq4hlk0KlRMgtKdOvntLwt2/CJtSe+f+3
	7Em8+NUF3A+IzdjocCIDxqlNe0WeSY85OyE93p+qT6KBUyOfhUBK4AtUWy+ZyzypKnnpA+atwqO
	Gzgt4UYQKoEBpqgrM+ha+zUomKh4cby0nRPC0IAESIGUx2qMgzS9LSRktyNH411wuwkueFKGTHU
	ltY1fs2Wm1DiVxSaGnmtUCnxcPlPnajqwFeLWL66dcUEAZ8oEgApnuoIBB01KsSECZ623sbZFa6
	T56oRN/E=
X-Google-Smtp-Source: AGHT+IGypB/6b6ARKmDBu94pyV9a8VQg2efcRX5KU7nOp2iuQaxkdpIq9rBXtaXWDKzDk6KRW6vJqA==
X-Received: by 2002:a05:6000:4112:b0:391:b87:37ad with SMTP id ffacd0b85a97d-39132dad239mr349795f8f.42.1741293946634;
        Thu, 06 Mar 2025 12:45:46 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c01de21sm3140996f8f.59.2025.03.06.12.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 12:45:46 -0800 (PST)
Date: Thu, 6 Mar 2025 20:45:44 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
 eajames@linux.ibm.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org, awalls@md.metrocast.net,
 hverkuil@xs4all.nl, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, yury.norov@gmail.com, akpm@linux-foundation.org,
 hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v3 01/16] bitops: Change parity8() return type to bool
Message-ID: <20250306204544.35086b52@pumpkin>
In-Reply-To: <20250306162541.2633025-2-visitorckw@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
	<20250306162541.2633025-2-visitorckw@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  7 Mar 2025 00:25:26 +0800
Kuan-Wei Chiu <visitorckw@gmail.com> wrote:

> Change return type to bool for better clarity. Update the kernel doc
> comment accordingly, including fixing "@value" to "@val" and adjusting
> examples. Also mark the function with __attribute_const__ to allow
> potential compiler optimizations.

If the result type is 'bool' you should just check it.
Not compare against true/false.

	David

> 
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
>  include/linux/bitops.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> index c1cb53cf2f0f..44e5765b8bec 100644
> --- a/include/linux/bitops.h
> +++ b/include/linux/bitops.h
> @@ -231,26 +231,26 @@ static inline int get_count_order_long(unsigned long l)
>  
>  /**
>   * parity8 - get the parity of an u8 value
> - * @value: the value to be examined
> + * @val: the value to be examined
>   *
>   * Determine the parity of the u8 argument.
>   *
>   * Returns:
> - * 0 for even parity, 1 for odd parity
> + * false for even parity, true for odd parity
>   *
>   * Note: This function informs you about the current parity. Example to bail
>   * out when parity is odd:
>   *
> - *	if (parity8(val) == 1)
> + *	if (parity8(val) == true)
>   *		return -EBADMSG;
>   *
>   * If you need to calculate a parity bit, you need to draw the conclusion from
>   * this result yourself. Example to enforce odd parity, parity bit is bit 7:
>   *
> - *	if (parity8(val) == 0)
> + *	if (parity8(val) == false)
>   *		val ^= BIT(7);
>   */
> -static inline int parity8(u8 val)
> +static inline __attribute_const__ bool parity8(u8 val)
>  {
>  	/*
>  	 * One explanation of this algorithm:

