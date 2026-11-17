Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917676;
	b=JoAKd9ewrbhvq2NY7zE9u0vLdMrenlEZCBiQ+lsWrjgJBTN9ZwDrFYoIZmoIxQG2T1F1
	 szFBF+xEBrPDhMceftUfzd8gzIYJEd4aThuPxJjJUhSPNZSm/wFe85OU6vor9NKzuqGn1
	 AvWStjymLVj9WlQZCv7Alw1nm9TKIMM4yEF9AHk37zHdrqb3FHX3+aavg1lHSwHBp4Aph
	 KpxzCKkuG8yv3Qq+ZxsUC5vL3vOvSlFcyzmP7xg+WQmZPBS45oxYpgiuoJ+KT/nCX941a
	 3YHtO+iaKrJHIaKeu/c82V2G5kDNbbWTZYer/BaGV2rXHilJH69eZ4is1+FrMq1kwRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917676;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=+MNym97pzJ7qmUoiMY8sbiPQF5RpntmoauuiPw8uCY4=;
	b=fm0TYm3Ft7ixIc1w2lC+0smm1YBD8Y5lpMqCvJDbF7I2kU9GlxKeN+Ki6Dmc5CKns6Ut
	 tbM9d4S0iJEQUAMwrH+1W4DGhL8QpP96kSsBJIGNSdJdPQULFEZZKm2KzrrpOMXoKq3O+
	 6ONyFqmidU520/pb8856Br1hbYxN2Ja+q2QsgNaICWBHHmV9AfRhmgM8VfUrHvMPjdsRd
	 1LIBL19llDhzVS9EBaoMsK06OJ1hKhJeuuqrQj7PoEqEJ5JwTr8oOFWI49SWJ/sq2VCnI
	 UKa/OWsn5AnOXyyv8+ShxbaC8xZXKsorTnwDTRwBK7sw06zl65+WLtYa5rbtyPZo/8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=XB91OuSN;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D11606A329
	for <brcm80211@lists.linux.dev>; Tue, 17 Nov 2026 12:14:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32D11606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=XB91OuSN
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso2136824a12.1
        for <brcm80211@lists.linux.dev>; Tue, 17 Nov 2026 04:14:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917675; x=1795522475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+MNym97pzJ7qmUoiMY8sbiPQF5RpntmoauuiPw8uCY4=;
        b=N9qZ3jdLU70ROdIEInswADlMtSXpuYXmbuTgUgeX/rxlwAEyMuE38TxD8AOLWl5i4E
         tFbftLFLhmtfODchpHMx3MkrEmR1CZ8vbwkYaJ7GW8XWS5LYWGO2ZqcASTVJ4xJGRur1
         is0LnCZGRUgaXgtGfGT/rxcS/49YrigbwFWh869UDQN0Xo68pj+/YFnSOQ53j0dkomaO
         prptTufwla9kUeWTGHe79yJZBhAFWrtTF3trXopcZhXMXlIG/Yq8yN1tj7nsQFtop57i
         ppItIdCYMvyzhnL0xgFnvtoUHaABFtObXySBErOgATyo3K0Jf4v+XOP+zk/G52IlepXZ
         xUGA==
X-Forwarded-Encrypted: i=1; AL+hErH3OeogSjc+G+YzGmk6palmNdf8TwbqGgRMjm1dkhuJExcLWj6B5WtGqD5DOf0aIsu7ze149OkrkO8=@lists.linux.dev
X-Gm-Message-State: APuU4Z8igfhEyKhndBsBr/iKx80WC6+RLNDbKKOPGLlfRPJQQ5CHPrcN
	O3tYQ/hgh8zjymSlUqPL+WmKOWcBmSWbr6Hj/kHNjwZ1TQjjMiPqCTq4q7kM4PcZXRCTjECDvHq
	mXv0TtjPRGfoI354e6tbfv3COyPni7HwjFoXEI3EFfPPzYzCbkEY7ivzob752Pw39EBSiGinUC/
	XJ/HP0KonoNvuh6ggUx1C6SDkbveTVqAZ8OcvGCr6TWFa1vCVAgvAtQsPRayqq6VyLYdt/OV5/G
	QGFwVfQHvAS6o2To5I=
X-Gm-Gg: AZFdTZdnyb9iu8mHQXcRqfsZWSR0kn9i0MJuu8gm1mLVkXLV3tTyZAXAfivtDwaGn5c
	7ZxW7i+uqv+/Laym87UYG2fAZxTqK8uyBvjNCNfPjEThR8AwY/w2G5mOprk/VFBMTUyeW/ZouBT
	XR79UddNew2d3JnO96zjRQQIm5XNzcxH2Ceb34KNFTi7tDu/QGVvufAT8T+DZjYkJNhm4iEkqdV
	8hnD35qvTPwYBULLdaClrKEnm3eQyHhtm8r3HFlQQU9ZLFx8+YXE2rxbroXorbEgiDszPeoSgNi
	6r84SBLoyaTPG8UHDHmDn0r+1ApEH1fac8tPcgjAZYe+LYCUqRA8wzD6zND9RTL+DpkO8qKVpe3
	vbCOop+lEvKNXXwQRVYFFjbNL8zjfvOz2wcpHwgV06HgwkffU6V8pczDu5D57xdFYboHhgLn8Fy
	T9s4hIa8qfiuxy0Lz2jdqw20lMzXXneVmio1GJbMQX9w==
X-Received: by 2002:a17:90b:3148:b0:3ac:450a:fa22 with SMTP id 98e67ed59e1d1-3b1b081835fmr13650950a91.2.1794917675407;
        Tue, 17 Nov 2026 04:14:35 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b3f74ffasm5882971a91.3.2026.11.17.04.14.34
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:14:35 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-92105a68062so10258916d6.3
        for <brcm80211@lists.linux.dev>; Tue, 17 Nov 2026 04:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794917673; x=1795522473; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+MNym97pzJ7qmUoiMY8sbiPQF5RpntmoauuiPw8uCY4=;
        b=XB91OuSNLd5hr0SRVyRBw6JGZ0U3sqjPpDjpESgbxexhOJ/+A/WygWnfveV41esElL
         KtFChIXCPEZMCu3Wxm5FC9/cjCNoL6g8q3O2gABtFW8/Z5FzQzHIZqETx185erxRQTBf
         OkEE9put0sEhfjn0IplYwsyfj7I47p97XWDPc=
X-Forwarded-Encrypted: i=1; AL+hErEjXQbxE2uAeDCbXhg4eA8R3rfAJGHou1jDZmUQhp9Nc4suDeMLYYEwAUpbln0+KG5ffikdfnRI+P4=@lists.linux.dev
X-Received: by 2002:a05:6214:3b85:b0:91e:a540:e60f with SMTP id 6a1803df08f44-91f242030ffmr231618976d6.21.1794917673051;
        Tue, 17 Nov 2026 04:14:33 -0800 (PST)
X-Received: by 2002:a05:6214:3b85:b0:91e:a540:e60f with SMTP id 6a1803df08f44-91f242030ffmr231618536d6.21.1794917672489;
        Tue, 17 Nov 2026 04:14:32 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d952fesm108043226d6.32.2026.11.17.04.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:14:31 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Jeff Campbell <inca.jeff.campbell@gmail.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless-next] wifi: brcmfmac: enable 2.4 GHz VHT on BCM4366 before AP bring-up
Date: Tue, 17 Nov 2026 13:14:27 +0100
Message-ID: <20261117121427.3299125-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104170426.4129715-1-inca.jeff.campbell@gmail.com>
References: <20261104170426.4129715-1-inca.jeff.campbell@gmail.com>
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

On Wed,  4 Nov 2026 17:04:26 +0000, Jeff Campbell wrote:
> On BCM4366 firmware 10.28.2 (r769115) the 2.4 GHz radio defaults to
> vht_features 6: proprietary rates and 1024-QAM on, 2.4 GHz VHT off.
> brcmfmac never sets this iovar. As an AP the d11 PSM watchdog then fires
> repeatedly once a client passes traffic, the client disassociates and
> never completes DHCP.  This renders the radio unusable as an AP.

[...]

> Set bit 0, keeping the other bits, on the primary 2.4 GHz BSS of the
> 4366 family while the radio is still down. 5 GHz is left alone: it
> keeps 6 and is stable.  This stabilizes 2.4GHz AP and clients now
> associate, DHCP and pass traffic at normal levels.

[...]

> ---
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c    | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)

> +	if (chip != BRCM_CC_4366_CHIP_ID && chip != BRCM_CC_43664_CHIP_ID &&
> +	    chip != BRCM_CC_43666_CHIP_ID)
> +		return;

Firmware 10.28.2 (r769115) is the version of both brcmfmac4366b-pcie.bin
and brcmfmac4366c-pcie.bin in linux-firmware, so the firmware is covered.
The radios are not: you tested the 43666 only (4366c image), while the
change also applies to the 4366 and the 43664. Please mention in the
commit message that the 4366 was not tested.

I ran this on a 43664 with the 4366c image. vht_features is 6 by default
there as well and the patch sets it to 7 when the AP starts. A phone
associates, gets DHCP, and the AP uses VHT rates (173 Mbit/s) on 2.4 GHz.
What I could not reproduce is the failure without the patch: the AP
started a minute after boot, on channel 6 at 20 MHz, ran 60 seconds of
iperf3 in each direction with the stock driver and showed no PSM watchdog
in the firmware console and no firmware halt. Which client and traffic
pattern trigger the watchdog for you? Please add that to the commit
message.

Also, bit 0 is the 2.4 GHz VHT enable. The firmware builds its own
beacon from its settings and brcmfmac only parses a few IEs of the beacon
that hostapd provides, so with this change the AP advertises VHT on
2.4 GHz even if hostapd is configured without VHT. Please say so in the
commit message. If that is not acceptable, start_ap() already parses the
beacon IEs, so bit 0 could be set only when hostapd provided a VHT
Capabilities IE. That leaves a non-VHT AP at the values you found
unstable, which would then need a different workaround.

[...]

Nit: "2.4GHz" should be "2.4 GHz" in the commit message.

Regards,
Arend
