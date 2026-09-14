Received: from mail-ot1-f99.google.com (mail-ot1-f99.google.com [209.85.210.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859FE31F9A7
	for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 20:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789416245; cv=none; b=RvI6dFg8Mn6oqWHgoVUxUDWE+UKdEoxU7/G4+hkbRwydKG8YmtrI0YaC83zapsGD8KL/36zXLIWA6YioyCynJ0NzssmQD2Cy6onasnjAznqJWlVeF0MGnEsiquGNjEQb7DqrSD0xv1TwhuJDY1CVN/GGpqvMmKuyzazPkvazqHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789416245; c=relaxed/simple;
	bh=6LuHeB2B9gfDtvW//US1kxn9aeemfl97PMPh7pLyaE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JmrYtKDGS9YQ91OdiZa8KcCwUBT8fFW6FSfHbWhtD+NmeJHEvkLv+HF4vRo5vTA/4FPtLZUXixNRuCGlX9Jlg/ohEh6I6unQTUI9a3Ui3Gfh/0D3gM8hzoRgJp4/9gV5xzQcQgfMaVezImQfhIp0otybH5D+p83pHuMnlVMXSQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=cOufSwWB; arc=none smtp.client-ip=209.85.210.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="cOufSwWB"
Received: by mail-ot1-f99.google.com with SMTP id 46e09a7af769-7f4dedd67b8so1359719a34.1
        for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 13:04:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789416242; x=1790021042;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Za6WPJocD8FEguqITMQO4/agEkWnsmf3pOAvhAhvrzE=;
        b=jk6AcWiCpF08N8qtAUnBKXejIwmwX2hX+06OhG339/U7swWRC2IHak/JVCPlTta9Om
         9el9NJu8/6QIcP1GERO3pvpm2skd2YrY6tQzlJSmpHNrNN/fRKWbIHHQq9qD1GPQ3hEt
         2lDlr4uhGcriNp4+P/n6F5+22C55gwhh/jMTjFyQpA+j5VXdahezzTlKNXriCfFmC/+h
         vrXJSHGg5yDSk9NzVQjZMOzsVeq941wG8PWH2Uh9FyFd4c9sjNzEMCw0WoUga5xZRpoI
         j0W9GR8tYLzVhsX6vEICyGboU1dyEKRNEnGav5WIq4S6qrYV+8Kyx9Le+LI/9QAJEGPQ
         Pz0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzGtvMi++Y5F936uaehwXhcc1618n2A4X13vI+dpMTf8vmlBSmZ3I/VdVE0O+ntN6CbcclmaCXNueo=@lists.linux.dev
X-Gm-Message-State: AFuF++noJBYB35ZY33OGKCYUKG0cWbXOUMashm6XvP3FUMwu51rSC0bB
	85h4Sm8NHFoFnPb7WXWtzpdu96oWQy02WOuilw1C6HY6X6YEro5xCEKDmc2qKn+yZboUcVsrSu2
	e6YV/VvkfBPBb4kCI27qtJ9oZGDknztmYUfN+90Ve/LtbLmGUIkpZpiSGUu6yez1ANruE7Im5/p
	ubp3dDlPUf4t6m/hHwrmCXgR0SmTnWq5uMCDNyxv6Lw5qkykXdPgFXDNJCguuQ3hQjSe/nTBjBw
	5DXYpUvAd33HZ76nrUl0Q==
X-Gm-Gg: AYBFou2WND2FyLGm0I2UGlEnQSZWJTbtSqvwXtKUuWn4NbzeDZ1xeMMqJXFgCTvOOp+
	878b8NTFcH4M63xt7oyynZoyRahE42oS6gmxhkfFuCF1Ijdyw7nBxCIJLiwSaNDmOjlvbUvqY1i
	3uKi4hkFyBYrw/SfArnHf2//w424to9AexXY0fQmRgyDuzL7Mwzw/uDUfGPiDyGRAyhRgDWoQj8
	Gl1MtXuezQ4xEZHeaBV5a69ngRV07YkErLKYpM4vny01YTKML7ttupSzxiDmgMVSpPyjPofgvu6
	P1Fzd65JPfF7DOR7m+3wxxF5f+AyoI6sw+d4l3lIt4hQnYqZVBg9sMKr934rj6wWvdR4azoP8P9
	o4pz7yoAM/cfovY1joYAhj90YH5coYKS2ipKcO0GTy6bmEl2kT9SYymOGGPZuBOfiFH7VtobQsT
	ss0+NEaC307g0byRoET2H+cq19OBrB1AcEI34AKVQ=
X-Received: by 2002:a05:6830:438d:b0:805:b3e5:18d9 with SMTP id 46e09a7af769-80899457cb5mr5457862a34.10.1789416241979;
        Mon, 14 Sep 2026 13:04:01 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-80780d65c03sm2815021a34.2.2026.09.14.13.04.01
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Sep 2026 13:04:01 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530d86d40abso73225941cf.1
        for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 13:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789416241; x=1790021041; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Za6WPJocD8FEguqITMQO4/agEkWnsmf3pOAvhAhvrzE=;
        b=cOufSwWB6XH3CgN/2ZX81vARmLdxkpb7styk5gL+3D6IagxYGSSY60UXR6CGmu4Vkp
         7Llvy+/dGP2LE1XE9zb68r2luUDsA4aIhWPn+qrRr+A2SM0ZGBK7PrJrov8paU5qhNT1
         WQuBmTye2ahmS4WBn97annYEkyC7WRBjPQKww=
X-Forwarded-Encrypted: i=1; AKwUvBxa9N/TQuEjV82Urd94bq0E9G8ldE9lLqe+x8JywB2MPxX4et11Q9qS86XMks1olnVXew5gr88DTPA=@lists.linux.dev
X-Received: by 2002:a05:622a:130f:b0:530:cc3c:c62d with SMTP id d75a77b69052e-5310d079411mr57824121cf.44.1789416240923;
        Mon, 14 Sep 2026 13:04:00 -0700 (PDT)
X-Received: by 2002:a05:622a:130f:b0:530:cc3c:c62d with SMTP id d75a77b69052e-5310d079411mr57823351cf.44.1789416240151;
        Mon, 14 Sep 2026 13:04:00 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca4b9c54sm105946511cf.20.2026.09.14.13.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:03:59 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: =?UTF-8?q?Vin=C3=ADcius=20Ramon=20Fontanela?= <vfontanela@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com
Subject: Re: [PATCH] wifi: brcmfmac: allow ISO3166 fallback for BCM4350
Date: Mon, 14 Sep 2026 22:03:57 +0200
Message-ID: <20260914200357.1743468-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CAKuTqBQoU9sSN7AzOQ5kBbBjt0CD=N0KBK8GwocBn1dOEVdVNA@mail.gmail.com>
References: <CAKuTqBQoU9sSN7AzOQ5kBbBjt0CD=N0KBK8GwocBn1dOEVdVNA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Tue, 1 Sep 2026 11:49:37 -0700, Vinícius Ramon Fontanela wrote:
> BCM4350 devices using brcmfmac on x86/PCIe may have no platform-provided
> country code map. In that case brcmf_translate_country_code() falls back
> to ISO3166 codes only for chips accepted by
> brmcf_use_iso3166_ccode_fallback(). BCM4350 is currently missing from
> that list, despite the adjacent BCM4345 and BCM4356 being present.
> 
> [...]
> 
> Signed-off-by: Vinícius Ramon Fontanela <vfontanela@gmail.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 1 +
>  1 file changed, 1 insertion(+)

The change itself looks good, but the patch was corrupted by line
wrapping and stray text, so git am fails to apply it:

error: git diff header lacks filename information when removing 1 leading pathname component

Please resubmit a v2 using `git send-email` to avoid line wrapping.

Regards,
Arend
