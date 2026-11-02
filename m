Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638700;
	b=xrrpoP7kd9hHLL0xpOyM7yrCh1I0typpGDgfLuerYzpdg91ndkfOX22tZyRwyE4Ofb6E
	 5wcieZXSnwfdlVDyJY6SZ8uKTzML0dhavrHew6Ziqe4rU849zlVKcZ/Cq3+6r/kEanX2y
	 jxXsEZTvRYPNQVJ7kLvwYqZ//qrT891tpjXmY9FzTZkRtoAatJadahqtH/gcg1rnzNoef
	 /CIhY1gVN3QDstrRwmLr4aXzJ2d5XzU7uzhVQYI70btKT/MD12A+yynnRMJ/vFOHfSoSk
	 Otdb7ChyR4J0YqJihTJEtLgjp6Hx23gGr31Bx6/cuLwf01eQ1njCBRpTeFSIqalfaDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638700;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:CC:Date:Message-ID:In-Reply-To:
	 References:User-Agent:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=KIqsitZcMi7h2QQHA4zZ281+QxpG2+lZy3zu6UwkhTg=;
	b=iZuqvbMgNNWi5ld4y60Vtd+IJAKUhSAN+bvgOgcpcMmwgFJNtpQC9O9nW51dRYgQ1EFf
	 /XPXj9jvzmEoAsSzpUXeDDzXjxkjZsYTJfdnL9AP5ciDbxMoTwRTcT4wK1YGk0+FhWJQ2
	 s46Oq5gQ4zbT9l5ray/hdukfgTesAKKOlZxll6yoqMcjwb/q1KUMLL3WgmSPjy5PMOc6P
	 v6bkI5vC8ZXyEOWYyUG+qYBOnecXm1Ef339tDrt/MaaNrBKh+IX3wHoGtGOymy3luCWo0
	 8PPJ49c9U7K2tny+wRLOGdDcG7qHxCBoE69feNrhFS4FqxWljwhgjdh8saAUaBIWEfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=MUPcn2cL;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877C1606EE96
	for <brcm80211@lists.linux.dev>; Mon,  2 Nov 2026 16:58:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 877C1606EE96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=MUPcn2cL
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3aded3c6103so1530303a91.0
        for <brcm80211@lists.linux.dev>; Mon, 02 Nov 2026 08:58:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638699; x=1794243499;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KIqsitZcMi7h2QQHA4zZ281+QxpG2+lZy3zu6UwkhTg=;
        b=kd311Zv7CSAJWn+8jzhwkQlUX+LOc7w6gcR2vr9iEuFwOFTUcxGdDOZMveYJ7EW+O8
         33pKJhNC7TDHk4i44P9EFsR2yZvEaH65BWnix6+fPe97FTTDC6xYXWW6+kPTR1LiWzLg
         Zjpluw5vVMunN27yKB7hLAEJtSjYiLTlg7o61ZXClkMXh3RFk7cyEmMnKvvonF5Ckbkw
         IRYLpFfMqmMTQfknpJI8GeKuVaNcibpKITi9RYyGP7oGz966Vkv89EUvZMYm06ania4w
         pfnUTlIQFh224o6atmTom6WO8IUyQWEx6PH4Iwa35FabXP4ForsFOwMOR1RUpfiTM0NG
         PkFw==
X-Forwarded-Encrypted: i=1; AKwUvBz2BdpiNSNrWImkdPCv7N4sTyAePlhcEI55mX6sWjoozDQTbh/LigGRVbI231ET64lYqeQMiC+ZEhs=@lists.linux.dev
X-Gm-Message-State: APuU4Z/zvpRFsViAXxzeyjc0IE5ZN1hn9SVo6V3dJF1+JB43qZvUzMAJ
	ynlNXQhbQdyAEqBLv2QMtQkczegVmBuRt9K14H2+rs7HjXk7R7yikiXxmvGGI4F33Oziut2DdaS
	cWPV8kcltuDRXawDoFvLISQzIxVIFehZOPjv4yoQb8vp8oNgTeSgsfLK8oFeuy16PDZ6MNxoPs+
	w4vaWKk6eRLCV9BtrreXDEG2VFJevkdepafMPGTttt/vQyyx7KCH/m9Lo0K1xChloEy3Hwgh60Z
	QvBCbtgAUEEm5aNySqX6g==
X-Gm-Gg: AYBFou2LvvUMfNt+taU1Sbojt1+WbkReoRDogseneveWFj6vwtwp1AKf/zMuFEbgora
	aV0vceOzWa9SZuwI4GynK55LvLkZzIlNwqFQ6aNOsVuXzXwgdyiLIO+7NI41QSa8dTcPyy8gT0f
	RDNRq6L6ponxpIJiZN54jwXnybrvjWA2Kk/PD+8XNYcqbfZWfNzyEz+W4A4ZVfXXWOijBTdLnqU
	L40BcMhR8clxUR9zwxmpbJ24l87CE1A25iM9aSlK+H+RGnxWEnIvaqJNWdWM78qk0d+q9En5bvq
	6N84CyVC8PgB8uMRHuJT8VSYqoJuF4b+lp4j9l0T/XHiqIT6UCzL8xOk0R3IkcG0SCjOYNCmoe9
	36imOu37/BYyIIWqU2xMROiDM1WIalLLoXRh6ptA17x4mtj3xlzWD3Jv7vPvjjeIdG7ktAcevA4
	RTBUARIfy5bmuZVT3JTFFV3CVdxwIv+HtI8CtAr4w=
X-Received: by 2002:a17:90b:17c5:b0:3ac:7c52:faf6 with SMTP id 98e67ed59e1d1-3ae89574d7emr8337333a91.1.1793638698767;
        Mon, 02 Nov 2026 08:58:18 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae6e84adc9sm10164646a91.5.2026.11.02.08.58.18
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Nov 2026 08:58:18 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-843cf077bf7so4403441a34.2
        for <brcm80211@lists.linux.dev>; Mon, 02 Nov 2026 08:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793638697; x=1794243497; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KIqsitZcMi7h2QQHA4zZ281+QxpG2+lZy3zu6UwkhTg=;
        b=MUPcn2cL5J7sdLSB0Lzf05PZlRn6qg2zMBwunHI0VZCYOybZPjh509eZajv0/YeMRY
         KJgttDmlsBuStsH3yit3hjXVTmorzVPPew+vELwuOpevglRKjnFYAdHUjvZmRJTiYJwL
         AmgQcd3YJ7Ia8ZLZfTHWhsEJiKcW75ZGbRzoo=
X-Forwarded-Encrypted: i=1; AKwUvBz4mY715Q18g2RsEZaaxug46tK5Qr0A0WMsBDi7Vl8cO/vJzCd/1REBq/+52s4dknqkLAANKjFcOe0=@lists.linux.dev
X-Received: by 2002:a05:6830:2e04:b0:84b:c230:c2c1 with SMTP id 46e09a7af769-85d36400d05mr10579866a34.18.1793638697450;
        Mon, 02 Nov 2026 08:58:17 -0800 (PST)
X-Received: by 2002:a05:6830:2e04:b0:84b:c230:c2c1 with SMTP id 46e09a7af769-85d36400d05mr10579847a34.18.1793638696985;
        Mon, 02 Nov 2026 08:58:16 -0800 (PST)
Received: from [192.168.178.59] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354985cdsm9955316a34.10.2026.11.02.08.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 08:58:16 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Neal Gompa <neal@gompa.dev>, <michael.reeves077@gmail.com>
CC: "Pieter-Paul Giesberts" <pieterpg@broadcom.com>, "Franky Lin (Zhenhui)" <frankyl@broadcom.com>, Mathy Vanhoef <vanhoefm@gmail.com>, Kalle Valo <kvalo@kernel.org>, Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <asahi@lists.linux.dev>, Hector Martin <marcan@marcan.st>, Daniel Berlin <dberlin@dberlin.org>, Janne Grunau <j@jannau.net>, <linux-kernel@vger.kernel.org>, Hante Meuleman <meuleman@broadcom.com>, <linux-hardening@vger.kernel.org>
Date: Mon, 02 Nov 2026 17:58:11 +0100
Message-ID: <1a19d3270b8.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <CAEg-Je918POdPr-=6Dzpdkx_i+Hv4wxv5-8A3MUDEqC8SA59NA@mail.gmail.com>
References: <20260925-brcm4388-submit-v1-0-b5cbc2cde2fb@gmail.com>
 <CAEg-Je918POdPr-=6Dzpdkx_i+Hv4wxv5-8A3MUDEqC8SA59NA@mail.gmail.com>
User-Agent: AquaMail/2.8.1 (build: 200801029)
Subject: Re: [PATCH 00/13] wifi: brcmfmac: Add BCM4388 support
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Op 2 november 2026 01:43:07 schreef Neal Gompa <neal@gompa.dev>:

> On Fri, Sep 25, 2026 at 9:49 AM Michael Reeves via B4 Relay
> <devnull+michael.reeves077.gmail.com@kernel.org> wrote:
>>
>> The Broadcom BCM4388 chipset requires new PCIe initialization and
>> firmware interfaces. Add support for these interfaces to brcmfmac to
>> enable basic station operation.
>>
>> This series adds:
>> - Signed firmware loading and mailbox transport
>> - Fixes for chip identification and firmware capability matching
>> - Versioned scan and join requests, and extended PMK payloads
>> - Updated event mask handling
>>
>> These changes include work by Hector Martin and Daniel Berlin from Asahi
>> Linux, refactored where needed for upstream inclusion.
>>
>> The series provides basic station support only. 6 GHz support is planned
>> for a follow-up patchset after this lands. The driver retains legacy
>> interfaces for older firmware.
>>
>> Tested on an Apple M3 MacBook Air (J613):
>> - Device boot and network scanning
>> - 5 GHz WPA2-PSK association and DHCP
>> - Bidirectional TCP traffic
>>
>> Testing required separate Apple PCIe and devicetree patches, as well as
>> Janne Grunau's port-authorization fix [1].
>>
>> [1] 
>> https://lore.kernel.org/linux-wireless/20260915-brcmfmac-4way-handshake-offload-authenticated-event-v2-1-fbb9cc7ac177@jannau.net/
>>
>> ---
>> Daniel Berlin (1):
>> wifi: brcmfmac: Support versioned scan parameter layouts
>>
>> Hector Martin (6):
>> wifi: brcmfmac: Support newer PCIe core startup and interrupts
>> wifi: brcmfmac: Negotiate PCIe mailbox transport with firmware
>> wifi: brcmfmac: Load signed PCIe firmware images
>> wifi: brcmfmac: Accept newer BSS information versions
>> wifi: brcmfmac: Support versioned join requests
>> wifi: brcmfmac: Add BCM4388 support
>>
>> Michael Reeves (6):
>> wifi: brcmfmac: pcie: Report the detected chip ID to the bus
>> wifi: brcmfmac: Match complete firmware capability names
>> wifi: brcmfmac: Fall back to RSSI-only default join preferences
>> wifi: brcmfmac: Use event_msgs_ext for event masks
>> wifi: brcmfmac: Handle larger firmware band lists
>> wifi: brcmfmac: Handle extended PMK command payloads
>>
>> .../wireless/broadcom/brcm80211/brcmfmac/Makefile  |   1 +
>> .../net/wireless/broadcom/brcm80211/brcmfmac/bus.h |   9 +
>> .../broadcom/brcm80211/brcmfmac/cfg80211.c         | 368 +++++++-------
>> .../wireless/broadcom/brcm80211/brcmfmac/chip.c    |  36 +-
>> .../wireless/broadcom/brcm80211/brcmfmac/common.c  |  27 +-
>> .../wireless/broadcom/brcm80211/brcmfmac/core.c    |   5 +-
>> .../wireless/broadcom/brcm80211/brcmfmac/core.h    |  18 +
>> .../wireless/broadcom/brcm80211/brcmfmac/feature.c | 124 ++++-
>> .../wireless/broadcom/brcm80211/brcmfmac/feature.h |   2 +
>> .../wireless/broadcom/brcm80211/brcmfmac/fweh.c    | 130 ++++-
>> .../wireless/broadcom/brcm80211/brcmfmac/fweh.h    |   1 +
>> .../broadcom/brcm80211/brcmfmac/fwil_types.h       | 141 +++++-
>> .../wireless/broadcom/brcm80211/brcmfmac/msgbuf.c  |  65 ++-
>> .../wireless/broadcom/brcm80211/brcmfmac/msgbuf.h  |   9 +-
>> .../wireless/broadcom/brcm80211/brcmfmac/pcie.c    | 560 +++++++++++++++++----
>> .../broadcom/brcm80211/brcmfmac/scan_param.c       | 416 +++++++++++++++
>> .../broadcom/brcm80211/brcmfmac/scan_param.h       |  13 +
>> .../broadcom/brcm80211/include/brcm_hw_ids.h       |   2 +
>> .../broadcom/brcm80211/include/chipcommon.h        |   5 +
>> 19 files changed, 1593 insertions(+), 339 deletions(-)
>> ---
>> base-commit: 42a9fb3382fc2573e92f41d203b095d9a372cfc9
>> change-id: 20260925-brcm4388-submit-5cb8d3e6d6a5
>
> Works for me and looks good.

So what does "Works for me" mean here. Did you verify it is working on some 
hardware you have? If so, please share the info.

Regards,
Arend


