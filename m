Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703395;
	b=jGNXmiFmFFnEBGKDAGlgPqm1Dh7Z/pUCQ5S/pkg2zkrf6oQruKtUstv0Nw22JNpHZ7w5
	 ZBuT9vqXtSWWktZHIRKTidvNZ5V4wBFvtATCT86Eh+BZ+i+MZcss5AYk96od78XsGRp3s
	 eWfMgoNfy3ZdAg8+98GqWiTNosXfPYIqcrGL2pEv0ntadzC6xd9QlKO3jZRrjQqb5f5IM
	 UYm+0r9ZlaTY0cpX09WemZJqxtuoccXxcit9UJUUwJrgLB6eSGm9U8QJFPc2qfMB+eGNT
	 h18zAC+8q6+AaCAcK9VnCl+mJNV2EO/sdQL0nszbwtY8ICrSWErpFcby8Lp4WbXXdxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703395;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=ni0P+OonBPhIdFE9YXhQeXLtmxxlE4xbNiyVqsQWDK8=;
	b=H0eFIXNbxdEgA9zQqv+s5CTpcIEBpScRrL0O0AdLOFT54iJQweWB7qh2mSVGNhotjWsW
	 KiJuFtEOlIoh66FGvqUM0GjXYVSxOydhn40Sy8ESu2s+rwZVd9Z843h8N5v0CN3lp0tfL
	 iVvGJqUp1ypsHmOn4cWRGtWuwEORv+uBiMH+ZzABMlaSBqcgG+PBMq5P5cG0z8NjwUk0t
	 +iGw9sNhCrU4R+DVcxcp6EQ+YpgtdyTZFB3icR/iTM4vno6g6Q3pQvlPtdUajUWgwviKi
	 K4dE7YtXfNFZOlVujS4ib3O0Z9vEklXy8EILzeL35G9H+lrqsnU3Y0TfhFcv0o3n3Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gQSc2MPn;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6290F606A691
	for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 14:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6290F606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gQSc2MPn
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b4cd193b50so1896360a91.1
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 06:29:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703394; x=1796308194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ni0P+OonBPhIdFE9YXhQeXLtmxxlE4xbNiyVqsQWDK8=;
        b=Gu62NxzrMicrMwKc/9oiXWUog+fB6OH8USLqBDisTJVKC6GsbhEeXV8q9RTUyaB30+
         yet9uMMVM4dBqzBjoiomBO/tB+Q04z7u3Is8ICvudw5+ZLXTuJPegqlQIOXUNDvUO51X
         HutQkWxh/3kXgE7oSlMoK6LrcdTU80JEtN3kZtTCdYjJ0mikPSOmjBYbJ/w4MBfKBdLs
         6667Bb6qHGnPyHUvmnCelj4CJKdrpYcNUoELnnpjXKz1GuVWmeUGHmYKwNUsUzhmYqMz
         F1HPpFsI+lJ8pzXojNtO8XU+W63O3hZc8KcOvJ450w4Npf9dk3wt6+nCIN5K/q9HH5a6
         S/yw==
X-Forwarded-Encrypted: i=1; AL+hErHk60aZUwhummtsAcfbxjaJDOcrJ9DkIJwFgXKsIh6snyvhMzpUkyyPGyaxTCQaDc2MIS91wLDkfbc=@lists.linux.dev
X-Gm-Message-State: APuU4Z/J2OUDpa0Jodt/HW/kk3CYrMYkEElluzMtnU72NNnQ3qGC/gJy
	1RHbP1tlr6I0BheMcML6sx8Whap2KclffQNq252/vdi/8bO+8zlZcuR12Vi47VX/8xKO0vbeJwj
	7eFK5+YN8IdgK6X4SL7giLmGsfLrC2kPqKqffRnWNBI4JkHCSQuMbruXn2SGp6O5jozXmhwpRRc
	9iATKKM7rUpnubK8Eoq/BdV7ZFvMqln3wSEL2dwWTZWhfA9wsQNvB9wWrsxtHMGTWWzXD25H+us
	CVmfnEEwMx1fdDMlFIWeA==
X-Gm-Gg: AZFdTZdfjZPg2x73zuwdLyAgiDWPYYs6axHQnBtoPrBanWBldj2FiHKZp1o2PZ61+HB
	dbSBzAYKalxE9DrzxZS8aW6L9ZZNurt4fyIGZVp5c61GXwC6zvqOL9kwc76KeDMePEHVK4VqdTn
	LQAe9hsDy07IexWUAXCT7AiiN1kZRhDgkjeuihfkPdBHTgETN0Q1rDKq9QDTAc0RtH5/zRRAwB8
	1eYOu91+mQMMg9YdMolnRbeBF9XtgOJVDNbIqh7OMwoN8MK5yT62UN4LReYb9LAb9AcYDct5Atv
	wlMUi1RRD8XSAd522AtJZI+E7qvwQsvLxt4dY0DEBoKdyd5QCTurGUglLrOPTOzWn3FIDQRo4Gf
	8bUkEFl6SuN5xtWNkbcNTiowYYVUtznAUUBMKApL2kU/5EMUdNZs8dAHH/XIFM4ctCY06jloIzn
	V+z6Ladwo6+ZPBpsE9wJHioY0SZwp45fqjdnDDclqlDw==
X-Received: by 2002:a17:90b:3148:b0:3b3:cab4:5060 with SMTP id 98e67ed59e1d1-3b41c8ffa9fmr20941222a91.17.1795703393704;
        Thu, 26 Nov 2026 06:29:53 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ae12863sm14881573a91.6.2026.11.26.06.29.53
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:29:53 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53639e47be2so133283241cf.3
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 06:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795703392; x=1796308192; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ni0P+OonBPhIdFE9YXhQeXLtmxxlE4xbNiyVqsQWDK8=;
        b=gQSc2MPnWm29VtF4uufOC2SiYK3IM0i1gV1kue/M84UQpnHTIkadvKbE/9/I5h+1jd
         XIZneP6cPG5bd4M75Ci40YvpGZIG/d9e5hQeOIBtKRuvpgh1EM0QMsMi3j7GIhA3I0oe
         tw3OqmpzdAS3ri7TN75tyrSjBfAH7z92D8I2M=
X-Forwarded-Encrypted: i=1; AL+hErEOtC4fiIuNX8iS/wqISgC4PuQK+mx/z0Ys8G84MGVRN7lUPn+JHikdgLT6sKmbzRm3tz50zvwSrBE=@lists.linux.dev
X-Received: by 2002:a05:622a:2586:b0:55c:6d3d:b688 with SMTP id d75a77b69052e-55d767ae63dmr394072291cf.0.1795703392444;
        Thu, 26 Nov 2026 06:29:52 -0800 (PST)
X-Received: by 2002:a05:622a:2586:b0:55c:6d3d:b688 with SMTP id d75a77b69052e-55d767ae63dmr394071861cf.0.1795703392021;
        Thu, 26 Nov 2026 06:29:52 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788506b0sm181098511cf.17.2026.11.26.06.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:29:51 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	michael.reeves077@gmail.com,
	marcan@marcan.st,
	j@jannau.net,
	asahi@lists.linux.dev,
	sebastian.reichel@collabora.com
Subject: Re: [PATCH v2 2/5] wifi: brcmfmac: pcie: skip the host ready doorbell at init once it is a capability
Date: Thu, 26 Nov 2026 15:29:40 +0100
Message-ID: <20261126142942.881504-3-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111120748.23795-3-dev@deq.rocks>
References: <20261111120748.23795-3-dev@deq.rocks>
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Wed, 11 Nov 2026 13:07:45 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> With host ready in the host capabilities, the BCM4364 firmware halts on
> the doorbell that brcmf_pcie_preinit() rings, before it answers the
> first ioctl. The B3 of the MacBookPro16,1 does so on every load, the B2
> of the MacBookPro15,1 on some:
>
>   brcmf_pcie_handle_mb_data D2H_MB_DATA: FW HALT
>   brcmf_attach: dongle is not responding: err=-5
>
> The BCM4377 stays silent without the capability, so it stays. Once host
> ready is a capability the firmware takes the doorbell as the exit from
> D3, where Broadcom's DHD driver rings it, after D0_INFORM. Ring it at
> init only when host ready is not a capability.
>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>

The sentence "The BCM4377 stays silent without the capability, so it stays." is
unclear. What stays, the capability or the doorbell? Also please add a Fixes: tag
for a83a99d063a0 ("wifi: brcmfmac: Negotiate PCIe mailbox transport with
firmware"), which introduced the host ready capability.

[...]

> ---
>  .../net/wireless/broadcom/brcm80211/brcmfmac/pcie.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)

[...]

> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
> @@ -1599,7 +1600,13 @@ static int brcmf_pcie_preinit(struct device *dev)
>  	brcmf_dbg(PCIE, "Enter\n");
>
>  	brcmf_pcie_intr_enable(buspub->devinfo);
> -	brcmf_pcie_hostready(buspub->devinfo);
> +	/*
> +	 * Once the host capabilities enable host ready, the firmware takes the
> +	 * doorbell as the exit from D3 only. The BCM4364 firmware halts on it
> +	 * here.
> +	 */
> +	if (!buspub->devinfo->shared.hostrdy)
> +		brcmf_pcie_hostready(buspub->devinfo);
>
>  	return 0;
>  }

This skips the doorbell at init for every firmware with shared version >= 6 and
HOSTRDY_DB1, not only the BCM4364. That includes the newer chips the BCM4388 series
was written for, which as far as I know ran with the doorbell at init. Doorbell 1 was
introduced to tell the firmware that the common rings are initialized, so I would not
drop it for chips we have no data on. The B2 only halting on some loads also suggests
the doorbell is rung too early rather than that it must not be rung. Please either
limit this to the chips that need it, or ring it at a later point if that avoids the
halt. Otherwise I would like Michael and Hector to confirm that the other chips do
not need it at init.

Regards,
Arend
