Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378192;
	b=SLu/+samg3IbnC7g59j28Lv/9uzPTDojzgO1V8z22Ieq8oUHwhFlBp2QAbOVL1upujfb
	 3jogwnZVx4FYmE91VwbQzW8fhvclnxD68Rzy9h/p46jjMQn6sz51PmmO6OzMQSaIKXRrU
	 D+UFTnCfLE3iwlRMeuIk3RVifikpsFv8p1+DvwSjwXSuVEFPznWIxcoV9ifyHMT1tblLB
	 EWrqyL9DCv0BdYr8PKygb5z1ANJaYrW6CaCYncBE6/iueI0iSAimmi0KR/ANn7QDXF8LJ
	 91X8i/SIHyJK+a8VsMaO5t5gqwxRwRFF4DO2MJ1WQC84ZEEMDz/3VchZNZnYHqtw99Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378192;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=znD4AFf8/IzQofgtA64x5aA+/MudrRRXANKmbKDYBVo=;
	b=qVJWgpp4RtPSrLdgGtmJWUgfZvuIrbCkOpummwfqR1Pouo6I8xo6461SPUVapNBIpR3V
	 Kqy5+lciywWbg3sIDvRKN9bwHdVMYK8FyUGvBtDKf7CZogJIZLjmHwF9fTUAA+kddBE6K
	 l6bHavRLXkiUnKC877simJnwrfytOYoL0a16RoFyt7z4sfHK94dvGm0xh7JNIvG93M1WL
	 AUvI9tDb/GPRp7tVbWcOftqWAeZjnr+2Woxhwg4NW/tQ3smJsBl3pwAhIAGHG2f0kGcC/
	 XWSle0G2OwD8pxdJCZXW1VrIQDA5Pa+20/ULUdrcXIHIIAE9n1Ti8T9EFiiB7ArJMMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KqIQl2NC;
	arc=none smtp.remote-ip=209.85.128.227
Received: from mail-yw1-f227.google.com (mail-yw1-f227.google.com [209.85.128.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4AA606A688
	for <brcm80211@lists.linux.dev>; Sun, 22 Nov 2026 20:09:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B4AA606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KqIQl2NC
Received: by mail-yw1-f227.google.com with SMTP id 00721157ae682-8b2d14968c9so23510657b3.0
        for <brcm80211@lists.linux.dev>; Sun, 22 Nov 2026 12:09:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378190; x=1795982990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=znD4AFf8/IzQofgtA64x5aA+/MudrRRXANKmbKDYBVo=;
        b=LZ/lEqauTJ6xlg/FSYax2yh75k5UzbeexRCQ/2/J6EQz13kv7Jv80gqgqSE4vE5DsW
         9h6/jf+/kKrr7Oyp4S1V9oQEyKPc3t6Bg1Odz9wYqSeIpkacHbt9LEPdDTp2EQeT3O7D
         m/fN4KWwEnakUUtDICD0Bl009Bl7XT+IAgSM6kVkumWDkVZNjTF+G0DRVJTRji5yYwID
         FtoWQHz0oW/3pUUHOc1wnupgcerbWO7YMJNCrwcf5T6J3fNIPmUvtCUmGgeAzxZcgFdK
         ZIo2RSRfP47B+YRA2+ym/orKjpCxU9aoWYn8wGhbrONQy3qSOq4EewfklrxoWkeRzB9+
         EvKA==
X-Forwarded-Encrypted: i=1; AL+hErFDbReQBhRRj39Ot7nhjdkbHdyv6gSxvucNcOOEh9XlkTdYn2qJsp2UA5kTkrJLuBdCO99kNpGdX2g=@lists.linux.dev
X-Gm-Message-State: APuU4Z99XIGFRMsFXjq0WAY1/jVieOAKVklEb90TV8rMYQEfgfPeVgMB
	muLPmR/XrKJeQ+e2DfO5lIYBi8Q4/VRdZ0iPQ9jraTZO7vXenE/eCHhd67KDqGkkMcfJtcCYQFS
	2EaHfBoQ4VjDT9w/YNpsUQ9jxGHHexCgnZTt9nqZQengeXusmfID2Hh6shV0SIeEL9Xc6X/Yi0S
	9LC0zFk7zP1zQ4y8I+3Ly+6nKCFdH47LTtqwpR6SKQYbtMixqjIMF+4a96TyyxhKuEp24MY8Nhu
	dl/j3xFHi6vmKUCYZ2wyQ==
X-Gm-Gg: AZFdTZdcJKqJ2pploUm3lDaNxKq4a81SFmBgLcVz+n5kCJubCN+UHgKS5DTEvxkGCQG
	t8DS5IN30+KoPUF7BnMJkhIIPGjI33f5eXW8tkhF97EWGFk2nBgjZHWqvvzufuoVDDmKUE2LgxH
	rnVh9v9ThrvMvQEuhC4TaXPKFm/MocMYydA602mjPS8/zpQ2kC/8wZXxfwG12nA4modwziv/3EF
	SYnSRxus9995fblm7tmP9N/YfPYP2Kly/CVX2wHNEiZOHFBGqtsHvDCQ5leRtgj7yJVbTb7VCxK
	EttFzcAspDCleSi81d9Xf5bo/xFYA5Ng2/FlqzcadvLEwOPHSAq9cAfU9iWZoG8XheBICurrKjx
	L+GhWN/BumZmQ2CCoXkdE4ItnOQ0hbpqz021WU3+Vv6DIFUOxHmsvYbk/4gXczimHGpoXxyMp2q
	4oSuuRfvsbnreXacs8g6FTOaPd84peRSRkoKr1GVE=
X-Received: by 2002:a05:690c:7409:b0:8b4:d9d3:5740 with SMTP id 00721157ae682-8b52032cb00mr30968597b3.4.1795378189834;
        Sun, 22 Nov 2026 12:09:49 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-8b5202c571esm635167b3.26.2026.11.22.12.09.49
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Nov 2026 12:09:49 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495dd0f07eso522253685a.0
        for <brcm80211@lists.linux.dev>; Sun, 22 Nov 2026 12:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795378188; x=1795982988; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=znD4AFf8/IzQofgtA64x5aA+/MudrRRXANKmbKDYBVo=;
        b=KqIQl2NCGl+o+JzcuVry8bv+S6f6mO81ierEDEv5YIz2xJDlnJ/X6znSGJfk/NusYZ
         I74tH5bxwK0BKXhYrBO61k1WZr2sM0i+FWUmP0ChkYEOa/oqVD1y8JpLdGDG45fNkUwk
         TG+R8tssAtrb0njm62kmQVQ6BRy803nLXW/fg=
X-Forwarded-Encrypted: i=1; AL+hErF1b7FBI3IyccflOHTYG5p+/HHQ484AirNQeBA5a6s/GL1VtXRtKJ59Le4LiPUcCnUmgg3P95BZXLY=@lists.linux.dev
X-Received: by 2002:a05:620a:2945:b0:949:6574:f36a with SMTP id af79cd13be357-949ba9d02e8mr1628684285a.38.1795378188450;
        Sun, 22 Nov 2026 12:09:48 -0800 (PST)
X-Received: by 2002:a05:620a:2945:b0:949:6574:f36a with SMTP id af79cd13be357-949ba9d02e8mr1628681885a.38.1795378187987;
        Sun, 22 Nov 2026 12:09:47 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ac11sm664845385a.14.2026.11.22.12.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:09:47 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH 7/7] wifi: brcmfmac: pass AWDL frames and role changes to user space
Date: Sun, 22 Nov 2026 21:09:31 +0100
Message-ID: <20261122200931.2090372-6-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104151547.70333-8-dev@deq.rocks>
References: <20261104151547.70333-8-dev@deq.rocks>
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

On Wed, 4 Nov 2026 16:15:47 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> User space runs the AWDL election and peer discovery from the AWDL
> action frames other devices send. The firmware reports them with two
> events on the AWDL interface, ACTION_FRAME_RX and AWDL_EVENT (98). A
> header is in front of the frame. Its first 16 bits, high byte first,
> are its version: 1 is struct brcmf_rx_mgmt_data with 16 bytes, 2 has 24
> bytes. Both events come with either version. AWDL_EVENT carries a frame
> only with some of its status values. AWDL_ROLE (97) reports the AWDL
> role of the firmware in its status, 0 slave, 1 master not taking part
> in the election and 2 master.
>
> Register the two AWDL events when the firmware supports AWDL, so the
> event mask includes them. Pass every AWDL action frame (vendor specific
> category, OUI 00:17:f2, type 8) of the two events and the role changes
> to user space as the vendor events AWDL_FRAME and AWDL_ROLE. Other
> events of the AWDL interface are dropped as before.
>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/awdl.c        | 122 +++++++++++++++++-
>  .../broadcom/brcm80211/brcmfmac/awdl.h        |   4 +
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c    |   1 +
>  .../broadcom/brcm80211/brcmfmac/fweh.c        |   8 +-
>  .../broadcom/brcm80211/brcmfmac/fweh.h        |   5 +
>  .../broadcom/brcm80211/brcmfmac/vendor.c      |   8 ++
>  .../broadcom/brcm80211/brcmfmac/vendor.h      |  12 ++
>  7 files changed, 151 insertions(+), 9 deletions(-)

[...]

> @@ -324,11 +324,13 @@ static void brcmf_fweh_event_worker(struct work_struct *work)
>  			ifp = drvr->iflist[0];
>  		else
>  			ifp = drvr->iflist[emsg.bsscfgidx];
> -		/* The AWDL interface has no vif, its events are not for
> -		 * the cfg80211 handlers
> +		/* The AWDL interface has no vif, its events go to user
> +		 * space and not to the cfg80211 handlers
>  		 */
> -		if (ifp && ifp->awdl)
> +		if (ifp && ifp->awdl) {
> +			brcmf_awdl_fweh_event(ifp, &emsg, event->data);
>  			goto event_free;
> +		}
>
>  		err = brcmf_fweh_call_event_handler(drvr, ifp, event->code,
>  						    &emsg, event->data);

The return value of brcmf_awdl_fweh_event() is not used, and a
failure to allocate or fill the vendor event drops the frame without a
trace. A bphy_err() on those paths would show why frames are missing.

[...]

> @@ -94,7 +94,12 @@ struct brcmf_cfg80211_info;
>  	BRCMF_ENUM_DEF(FIFO_CREDIT_MAP, 74) \
>  	BRCMF_ENUM_DEF(ACTION_FRAME_RX, 75) \
>  	BRCMF_ENUM_DEF(TDLS_PEER_EVENT, 92) \
> +	BRCMF_ENUM_DEF(AWDL_AW, 96) \
> +	BRCMF_ENUM_DEF(AWDL_ROLE, 97) \
> +	BRCMF_ENUM_DEF(AWDL_EVENT, 98) \
>  	BRCMF_ENUM_DEF(BCMC_CREDIT_SUPPORT, 127) \
> +	BRCMF_ENUM_DEF(AWDL_STATS, 150) \
> +	BRCMF_ENUM_DEF(SDB_STATE, 152) \
>  	BRCMF_ABSTRACT_ENUM_DEF(EXT_AUTH_REQ, 0) \
>  	BRCMF_ABSTRACT_ENUM_DEF(EXT_AUTH_FRAME_RX, 1) \
>  	BRCMF_ABSTRACT_ENUM_DEF(MGMT_FRAME_TXSTATUS, 2) \

These event codes are specific to the firmware used for the Apple
chips, but BRCMF_ENUM_DEF puts them in the common list where the same
numbers may mean something else on other firmware families. Use
abstract codes for them and translate them in the WCC vendor module,
like cyw/core.c does for EXT_AUTH_REQ:

1. fweh.h: replace the five BRCMF_ENUM_DEF() entries by
   BRCMF_ABSTRACT_ENUM_DEF(AWDL_AW, 4), AWDL_ROLE 5, AWDL_EVENT 6,
   AWDL_STATS 7 and SDB_STATE 8, after the existing abstract entries.
2. wcc/core.c: define BRCMF_WCC_E_AWDL_AW (96), _AWDL_ROLE (97),
   _AWDL_EVENT (98), _AWDL_STATS (150) and _SDB_STATE (152) next to
   BRCMF_WCC_E_LAST, which already covers them, and add a
   struct brcmf_fweh_event_map brcmf_wcc_event_map with these five items
   and n_items = 5.
3. wcc/core.c: set fweh->event_map = &brcmf_wcc_event_map in
   brcmf_wcc_alloc_fweh_info().
4. Register the events from a new brcmf_wcc_register_event_handlers(),
   set as .register_event_handlers in brcmf_wcc_ops, instead of
   brcmf_awdl_register_events() called from wl_init_priv(). Keep the
   BRCMF_FEAT_AWDL check there, and export brcmf_awdl_fweh_event() for
   it. An abstract code is not range checked by brcmf_fweh_register()
   on a vendor without an event map, so it must not be registered from
   common code.

brcmf_awdl_fweh_event() itself keeps working, the event worker passes
it the abstract code.

Regards,
Arend
