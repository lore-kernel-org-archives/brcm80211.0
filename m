Received: from mail-pf1-f228.google.com (mail-pf1-f228.google.com [209.85.210.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABF941A547
	for <brcm80211@lists.linux.dev>; Sun,  4 Oct 2026 09:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791107136; cv=none; b=kABsoyx3iddlEHrmaZREPKGbHlR1zXYspbjb3F9qF7U1qVkddkd5/k1FbYnb9puu0dFv8NaNXig25HKNb3U/ZBwKohVTuVx8gA0KnNlNuwDQiyGmAzITpNUueIId0CTn+ouKwpg5xZYHpG7leU8ctdmuFLocWlbmWM4sQy2JHyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791107136; c=relaxed/simple;
	bh=Ag0BlF3KCDLbw6AuOgxKAn9Hp07BqMJmHxvcfpE05iE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fs/xQWA80IvV+mto5v5aPXtP3bOI1lCzCADkU7SGI0NEkvDS3zCOCQTXKvDHZBuYVj2O5zq3J5aZTsLNTKTBappAqdxl/rqQNzLIsrvBRlRDQzC69qY2R5a6zFv7NI48A8NzpEqgH4Dfk9PnUyKj1z4b5QR8c1HYSbeDO/hDFH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=R1rJaTcx; arc=none smtp.client-ip=209.85.210.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="R1rJaTcx"
Received: by mail-pf1-f228.google.com with SMTP id d2e1a72fcca58-88b5f43cb8aso203156b3a.3
        for <brcm80211@lists.linux.dev>; Sun, 04 Oct 2026 02:45:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791107128; x=1791711928;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XGGB/zmyhc8PrzLjB8k1OEa3HYhJUNYtp/EwY8fznLU=;
        b=mN1fDsSJioHxRELx4d3R5mWvoJdZg7g9xso9NF5o2z4p5aiif2KNwJxvGTXVffYMom
         v85oAY1eN2R7o5DjRfsv62VXm5oRZaRM+wyU4ThjcZHPdEmUn/Iqpz4ZwOuddGz7LJbw
         MO9xNZ9vmSNbPsu8R3Upu3uhdlMwQCZWJub24/GV/8IS7pXYHSM0AuEV6Rfyi7faVCsr
         cu7ZUU5LmXmNdpODlkazGa3AgZMcQfLttzJnOE1mvaUskqoaZvpzc5XhaIjj95METfKx
         f6urjrXzTSbLAjRw+wx8jQ3PEijRDs1wCmoa3rhxbXzTYKQzJ3ivT10FR7ajM5oTDVme
         aS3w==
X-Forwarded-Encrypted: i=1; AKwUvByqvDP9gs64s0Mg2buGyhsfpfx87wj3t+XNHGCiuLMSMEuUvaU+pi+Cxt6W6VyySE8MCwPUczweIps=@lists.linux.dev
X-Gm-Message-State: AFuF++nt5tp3F/+2XBtmo0VyHNI1xV0Q9Gg1W1NbZLAk8G57B5TGikca
	EDbZtt/QpnaZPCQnFN44DH6y2my2DLkwB+bWFHKGaggk3eU+mgk5NsPUhnnUJiCDUFdXex9bHG8
	QbZOk6+ENBCBA5ByruVqkD1Cqmvp236tBiZAUHym3zLQXRbp4YkZCtpI9jUkBnHHvpw1twUXJf4
	hou8TkKSV7c9j6cTIlwUyqwIEH/RNrZjBH2Rt50tLroIq4wA1vrt7M4p0+ktEHddldEL+wW322T
	mzwSszwCYId8GDJFmfFrg==
X-Gm-Gg: AYBFou3/OgBdDZ3VsQzfrhisDVymvcLVQUkRRrR4I+mYLp8wbDZ+cOM+7mSOf2f4RNX
	ggDwETeX0jjjhkwgqYP+k+7ZKskJQ4p1PVvL7LJGNcq6rWhIJQMigXTEjGYEX+IEo0oqPb00fvB
	EfWvyKPlDkUjSW3mbwSHjKDkO92OnAmPbogeyizgcnOs1cUP2R/UtOGl7KF/RJ5BZVIKM9SOWfI
	K/IrCuhfo/qbLLxcrKcmVPDhll5Xe3zaQIblcUgNrOqwWPQEFVKH/5eWOGY6x7D8CLx/OyzQlgS
	9QRiU6XHI8Uei+H3Q0nqKVQAxHoYbgkTenDbHzHC9EMDbgK8swl4twaHQZs+zsKVC4Y1glx+G4E
	/Py10U0g4WCfbg2m3UtO5z+FoqzRHcldtqWocVG8XiUGPT3zzeHetL1Vr+9LnEovrHwEKw6xo8g
	TzRb7Z53ANOk7oe36PCFuPg4TXHXP3xlvo2QWlAK9Tzg==
X-Received: by 2002:a05:6300:2204:b0:3de:14ad:ae8a with SMTP id adf61e73a8af0-3e0d6b5537cmr3590274637.16.1791107128307;
        Sun, 04 Oct 2026 02:45:28 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-ccb756e6ceesm981763a12.14.2026.10.04.02.45.26
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2026 02:45:28 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34ef0362d95so1883694eec.1
        for <brcm80211@lists.linux.dev>; Sun, 04 Oct 2026 02:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791107125; x=1791711925; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XGGB/zmyhc8PrzLjB8k1OEa3HYhJUNYtp/EwY8fznLU=;
        b=R1rJaTcx1u4IiInqzQD1yNkWdOMH9hZjRc7wvGDf1eATusHoTObdavL2BWc4BYOf1i
         4msG0e5f+ueWSyrJ/Hi25zT75EolhrcXCkD2hfNIHgTv3wBjR3u6aK0p9QOsFu/Z8ncx
         Zh/xoWy5qkbtXVsqJJRz2RwdmmOzJysfGaBbY=
X-Forwarded-Encrypted: i=1; AKwUvByoGlxGgKXhHntV4DP5CzcVuw0zkinjhoop6SUiP2b4+Iwv/Tc79RnTwempDx4k83wCWY01DHXJmuk=@lists.linux.dev
X-Received: by 2002:a05:7022:3b8c:b0:137:fa50:a242 with SMTP id a92af1059eb24-151c0b1ba0emr5886124c88.1.1791107125212;
        Sun, 04 Oct 2026 02:45:25 -0700 (PDT)
X-Received: by 2002:a05:7022:3b8c:b0:137:fa50:a242 with SMTP id a92af1059eb24-151c0b1ba0emr5886105c88.1.1791107124612;
        Sun, 04 Oct 2026 02:45:24 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fa74fa1csm13821366c88.1.2026.10.04.02.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 02:45:24 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: =?UTF-8?q?Vin=C3=ADcius=20Ramon=20Fontanela?= <vfontanela@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH v2] wifi: brcmfmac: allow ISO3166 fallback for BCM4350
Date: Sun,  4 Oct 2026 02:45:19 -0700
Message-ID: <20261004094519.1323940-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915174300.28363-1-vfontanela@gmail.com>
References: <20260915174300.28363-1-vfontanela@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Tue, 15 Sep 2026 14:43:00 -0300, Vinícius Ramon Fontanela wrote:
> BCM4350 devices using brcmfmac on x86/PCIe may have no platform-provided
> country code map. In that case brcmf_translate_country_code() falls back to
> ISO3166 codes only for chips accepted by
> brmcf_use_iso3166_ccode_fallback().
> 
> BCM4350 is currently missing from that list, despite the adjacent BCM4345
> and BCM4356 being present. Add BCM4350 so these devices can use the ISO3166
> country code with revision 0.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Vinícius Ramon Fontanela <vfontanela@gmail.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 1 +
>  1 file changed, 1 insertion(+)
