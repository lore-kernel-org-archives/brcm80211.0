Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986621;
	b=HOI/IvHv2Y+OGSZH/C4mR1X6ulil3CSW277/4nx4lLuyi51rm2J1Vr7vuRKwPD4iP3yu
	 rAwMkk7k6GAg7WNYd7wBawkYM0gpFtw5XcJDtrXE6i6KyKnO54h78T/xPK4cNgFZkVqKT
	 mCOoXr7C+PHxG1OuupepXi2kFwDRCUbmoSuhg9t2Cxsf3qX0d4Xo6ahOd+7cNEmSbzJ/X
	 S69hBNxKoQjmNyvAuVCC37ebiEZFHxhNMDN/IFwQh2vTCLwwcKmDFGPPKZ7HJA5abMG8e
	 Z6bp3BeSI7KdpUIoOEAEJfvmKmzfBn/xUZ6wp6ZcRu0Q8Gsr+IhsHsgZqB/MgizK0zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986621;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:CC:Date:Message-ID:In-Reply-To:
	 References:User-Agent:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=YYev/NC+kvw4uKd6ceqPEumrLblYo4RG50oIiemWCCg=;
	b=duJNO1ubRjF0ufU6p+Gmaazaytjlo8l+3/TGvv65ZTMrBLNCFx5+TOD54l1nOqVIQioU
	 zG1UnCCm5GFvbov4n/n6RFFb0kOEQdnZzNtE6RsTOR6+7/xid4SCaWCXZA60GMEqtbwUg
	 X0JV1z/o4Iye0I4UDmJxtlQi9HvsLx81Bl+qKDWiLENDlLvQRKVFuAjMUFiRUo1biW5Pg
	 teya2enACP6fYqyXSPDhYuaafwBR+WiDOOqtNp17x/+ZX+EMKpdDH5eq2UnqZDJRyR+IM
	 fbZTsFNvNpd26wJtA+mZfwbI6CDQn8Rv/5Nz/y3BZTHoJgPW5uuP547ttL0wOkU5OEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VhtTr3RO;
	arc=none smtp.remote-ip=209.85.210.100
Received: from mail-ot1-f100.google.com (mail-ot1-f100.google.com [209.85.210.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3376606A331
	for <brcm80211@lists.linux.dev>; Fri,  6 Nov 2026 17:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3376606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VhtTr3RO
Received: by mail-ot1-f100.google.com with SMTP id 46e09a7af769-845788309b4so435913a34.1
        for <brcm80211@lists.linux.dev>; Fri, 06 Nov 2026 09:37:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986620; x=1794591420;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YYev/NC+kvw4uKd6ceqPEumrLblYo4RG50oIiemWCCg=;
        b=OovnalTICyDc1oRfC3PWdKxUIUfhmeG4fTbhtQWzsYCUUrexe6Jx8KZ+w8v5itL3gr
         t0EfI2hO6V5z5CFTk8dW4KK9la3eFmBJ7E0Ks7i2qBe2I36+Qrqv0yOdEDYrWEMLCAWD
         9fdPx9QRzZmdWF2ID84H6d8AACVJ3O88IDE5/gKANVDf7o66cWzv8YRHlmhHyFMya5tY
         /2IvQ4TI2HeYe7uFE6bi3pE7wrXYcsAGQJC375Xg5v+aN41squak3Uvr17Kt4OxiBbol
         BLzEl3MUvZhPKHSOq8B1pTa28CsM/SbVk6q7zxZ9YrFTrUche6w5pOnNO6fhPQshc6ZN
         upqw==
X-Forwarded-Encrypted: i=1; AKwUvBzos1GfMxH8ig0H4ZYchUMkcpQ0F48H3BQdIOg+JzdsvHsz/zQxpLnF9BDZhl80nws2dOoLcLRnQ8I=@lists.linux.dev
X-Gm-Message-State: APuU4Z940MlgT36ebwELlAE+MWEGHQ31bMiFnybiZN4d20inwzGeNBdv
	EAalo2JuAnit80sYUPjMiwNKMn6xbLdqSdkmTEm6+IWRJbCDTIvd4c2Cgu7w3XK57muN6bU2e/4
	7XXkR7mrjS9fPGWbmHrLgXUVdG90vSbf6+r9roWmJ8qSz8HqAct944OyWryYBh77w3S1sxI3BTv
	9TQz6CTweZj4PyY+fB9aO6T+Y133hwOKd879i0PtD0z9aeuHfwNKXQE1yVWYpxgktSkfvihBJGT
	Quzj8fZT0JUFOVTKb3Q7w==
X-Gm-Gg: AYBFou1ygiaGx6FsqT7mhNJ9sRgoidBPe1B4G0rx+w34BGpNlysMoI3p5QmPfaVzBOu
	Vn8ULQMYsBV3EpRIqJXbKKyiraXBAnJZjp5arKyoUbBpZjbz8HS5xXwbf2gwKUdgrFwevCdRM9g
	ZFo/5kvYztJZtvbUTIa0nogfp7UmvkWKgPonIWeB9yG5CRnU34MrLS3/v84HTnNM2ODNJsYHxGQ
	D5syUy1fBNcE38yL3SBx14hYKXtnNBZEZRi2zoZTi2N3Cwfx1/o/jOgGyQxECAexAgY8V8GdGMZ
	imfool64Knk1Zcroz569AuQKCMnTyXn4GRh9/SSZmFluFPG1frYy4dvx1JQimA2E2exkoDU4SDS
	uGFde8Z9XmMDzphKKIWpWPsCuHcZ8xeWUeG6ssLqrucCw9Gw84H4VHSdLQrhJZT4uo9YF6qoCg+
	EPu5bJ9CD5NaIAzqUD0P8fAV0mBxExVhZBDHELzGY=
X-Received: by 2002:a05:6830:2e03:b0:822:978:f7bd with SMTP id 46e09a7af769-85f1d063f5amr3592528a34.28.1793986619567;
        Fri, 06 Nov 2026 09:36:59 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-85f1dd123basm28352a34.16.2026.11.06.09.36.59
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2026 09:36:59 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6b59665acd6so770831a12.0
        for <brcm80211@lists.linux.dev>; Fri, 06 Nov 2026 09:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793986618; x=1794591418; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YYev/NC+kvw4uKd6ceqPEumrLblYo4RG50oIiemWCCg=;
        b=VhtTr3RO3PvS9qOlioM184RmtJFrHuZJVJnDPMgMur1evBdIuHOdpC29v0yx+40tg7
         /tAnPsbeyQH+CTjt1aBQTcmtaFtKI/qC91uHtzRsyEwTGYHOF9Kg4biOO9mGRjKbGAR1
         7/A08kO2PmiLa0YzcvLpw/kuAuR37YH/1RFYk=
X-Forwarded-Encrypted: i=1; AL+hErFgOO02skyoRcBwwxWVd6v3IBi0a3vafg1GVov0WcL3FC/42tuC1cY9TlihnTFqwKU/Cl6IgNmaDek=@lists.linux.dev
X-Received: by 2002:a05:6402:2b92:b0:6b5:90d9:70a with SMTP id 4fb4d7f45d1cf-6b5977c1176mr2516060a12.15.1793986617834;
        Fri, 06 Nov 2026 09:36:57 -0800 (PST)
X-Received: by 2002:a05:6402:2b92:b0:6b5:90d9:70a with SMTP id 4fb4d7f45d1cf-6b5977c1176mr2516038a12.15.1793986617494;
        Fri, 06 Nov 2026 09:36:57 -0800 (PST)
Received: from [192.168.178.59] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b664ad2d0bsm919103a12.10.2026.11.06.09.36.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 09:36:54 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: =?UTF-8?B?QW5kcsOpIEVpa21leWVy?= <dev@deq.rocks>
CC: <asahi@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <brcm80211@lists.linux.dev>, <dberlin@dberlin.org>, <frankyl@broadcom.com>, <gustavoars@kernel.org>, <j@jannau.net>, <kees@kernel.org>, <kvalo@kernel.org>, <linux-hardening@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <linux-wireless@vger.kernel.org>, <marcan@marcan.st>, <meuleman@broadcom.com>, <michael.reeves077@gmail.com>, <pieterpg@broadcom.com>, <vanhoefm@gmail.com>
Date: Fri, 06 Nov 2026 18:36:52 +0100
Message-ID: <1a1b1ef4b20.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20261106153612.2aadef2a@kait2en-mbp15-1>
References: <20261106153612.2aadef2a@kait2en-mbp15-1>
User-Agent: AquaMail/2.8.1 (build: 200801029)
Subject: Re: [PATCH 05/13] wifi: brcmfmac: Negotiate PCIe mailbox transport with firmware
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

Op 6 november 2026 15:36:19 schreef André Eikmeyer <dev@deq.rocks>:

> Hi Michael,
>
> I tested 01, 04 and 05 on a T2 Macbook Air 9,1 (BCM4377/4). IIRC should be
> the same chip as on T2 Macbook 15,4.
>
> Arend, with the patch we get D3 ACK on s2idle and s3. So this basically
> renders the D3 ACK WoWL workaround patch obsolete, you recently acked.
> So it will suspend now without refusing d3cold transition, but BT is still
> dead on resume, which is a separate issue. Just mentioning...

Sorry, you lost me there. What is the relation between the patch in this 
subject and D3 ack.

Regards,
Arend


