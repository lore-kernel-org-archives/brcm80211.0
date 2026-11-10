Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794338838;
	b=gileamcv3kxi3368OqNWhNawBTp8ij6nLcKQfLaRhKXfxj8IgaoI5OiaJxB1X/ugD/7e
	 gfW2WkEqMdYkvQ1mxLpO1EMPMGq6z1NjYdyWs11ynJN8y0jZpPEh6TuJXYgVTWuQzcEti
	 3Xg3qQQxflWKO8fB28HsF57UPzZ1SCNA6S6B1H4MYHaw6C2RPuhGA+txUkDsMIku0eyTO
	 7oP1xy0Yh+Qyuf5tWXzj51D154V6Aj1ejkCNFdE0IbAPFKKAcqKVfAmpHOvhQpyx91pDT
	 uS2VMbWY1Vy/GzFa7T7vt6FtrPuCdUVh1tvlfnisopufyDZZyfaVQxQp3t/QjzZJxaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794338838;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=yGtSveCQEvAEo8vEbw0oolMScwgHZwQg56T6xGM7xJQ=;
	b=Cu+aXj3baVjoB51N13LxvcXcrsfQ4+BLF8bnYRchndilpov6lqbBo0npnhzTa7wTRI4n
	 LbunHIEus2/BWzpb8OSDT8ftM2gbdFsXQ/yq03G02Nwwg++ocP0cQYC49tR+z01pgg3qk
	 dEElM7OUaOm6/ZoQKPS85OoszZFA6xPmJnt2R1ee5rWJcc4bBpdC5os8jdYpsvzWw4hPk
	 HP1GyMTIucnpy5C6NAIoE16RDW+pAbQLoFpD3DmBGeosA4FoDZ21sF58UITenKGnChlJB
	 SFeBkVXF6Hln0XcJhhincyfyCmcuJg3c0x3gN5NMLBwykVpIYmb21dHqN/sNscVGkqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JUU1mLKl;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3ED60A2614
	for <brcm80211@lists.linux.dev>; Tue, 10 Nov 2026 19:27:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B3ED60A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JUU1mLKl
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so1044531a12.2
        for <brcm80211@lists.linux.dev>; Tue, 10 Nov 2026 11:27:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794338837; x=1794943637;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yGtSveCQEvAEo8vEbw0oolMScwgHZwQg56T6xGM7xJQ=;
        b=Q9sK1T5Q3IIw2TcMb6nNyp13B8SIj2QdAJvNRGlTTC8iQN5aKDZK/j9S7FvRWh8r32
         1nLuskTOC9W60BYeRGHrAGT5cj5sp5vhEAv/vjCxmRPVkvPycnd17TEtEDm6XISB453q
         Ry9lov0bhNJQsaUFLClGRopswwJ00Zd9fTVJjvxw5/PGbpLyIipVbL5e6o68705Wutt9
         1ePzTTXcvVH3qNeGx29xqXzXi/ItPFLCE2Ge6dOg7L1nCcuUPLiOPC86llQgRiwJaNnR
         hKrW3QuZ/6de2ejMfY6m/0qrsRStcylDqpjEz7uYR8HJKv2ADBkJpEbTifrvcZ+l/x6l
         9Svg==
X-Forwarded-Encrypted: i=1; AL+hErE4j8WMbK+IkMv9KiwhH5iEP3pna/efj1UnGJsWe8Ql7C91obKPhrhdQQiynag/PuQ70geNqvCZp10=@lists.linux.dev
X-Gm-Message-State: APuU4Z/V31Lz68keL3R+pfccY8WS6M7cduhIe9EncjfqmHFPRr32O0Dz
	4aVD2OQoSk2MLPeBOTqRKSUQpop+JVfZLLyfzbaT6hEBlj9m6u1X6v9af70G15yRS51YdxETK/S
	BsMLcjzDw/rK4OyuCb7eBcI8N5Mq57pCT8Qkyk8X4QVFdrpK9TZJi4LhI/gb3BnEIN8vqpMK42H
	JBxWWTpfwO34U4hk99FfQRZTrba1k0CzQYeKvobsaXGTj/qN/TODwHXDY4QPYbBP2LqXvwoU393
	4UcXLfCGFnxR3zGdE8=
X-Gm-Gg: AYBFou0TCv5sWNCS9tANF2BOZ1MWPbiCs1DId9jMq5BtP4SiuVpRZzCjwT57+pDs4II
	/djLG2FH2KezwqH5jiRkn6MO/p5woOdB5BPqKV9TAzt9V64VI93/gDA9nzrh3eG9TqHmavwfEHC
	azCp3STyD5zr8rTy2mFQmaJRboa5rOWnWwRFCLAxkXktR4aWRv3+AK22zLGrfxyTywEhqJLsghS
	vd2hc0+l/yjadtnHcYT2O6A8luvnv72hAnFig09LXTIRoxlSoLdmqyxpqajzFK/tg84rDD7xTj2
	g3LRovpFCZKegCdZjw1jVdZCoY+bXyZSYW8FknqZ2PVH5iYPW+wCrrllVoFtN7MTHzSyy+LARQc
	2PUntPe632sKlYCrOAZ+3uNxeng1otWEtvZvn/ZSxiePa6dqLtoaWb66WCHlZGRyqF7/nAFe6F+
	JFxXoqvCxo/I0lu03L9zD9oOr+LkccOshqo16NOII=
X-Received: by 2002:a17:90b:2d8a:b0:3ac:ea3b:f28b with SMTP id 98e67ed59e1d1-3b166ceb599mr3383230a91.24.1794338837392;
        Tue, 10 Nov 2026 11:27:17 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b17e3294bfsm421549a91.8.2026.11.10.11.27.16
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 11:27:17 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so5462936eec.1
        for <brcm80211@lists.linux.dev>; Tue, 10 Nov 2026 11:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794338836; x=1794943636; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yGtSveCQEvAEo8vEbw0oolMScwgHZwQg56T6xGM7xJQ=;
        b=JUU1mLKlOUw7LCTuxIQoq6iVCP6w70MkoJV6NT9NGDbwQfPZaK2faAJL2j3WgnE5hR
         BKkNvs5HSD6BiI9SXhaaJE3OhbHXMvlIdSgswdmbLVcIfvwjXNepq/kosHJHAt0/54TK
         FAERRbj1UeroP2lgzmgVD/uZEFnCZtFamVCCU=
X-Forwarded-Encrypted: i=1; AL+hErFshdXNRyGo/zOsxx58GwCa1rwQ5XwdDzovldIlY4kbx6QwYGtJClyLxLHZ0IbaLjVgaJK8eYlbBvg=@lists.linux.dev
X-Received: by 2002:a05:7301:e01:b0:36a:1fa2:fbbe with SMTP id 5a478bee46e88-37686e2efb2mr449296eec.41.1794338835374;
        Tue, 10 Nov 2026 11:27:15 -0800 (PST)
X-Received: by 2002:a05:7301:e01:b0:36a:1fa2:fbbe with SMTP id 5a478bee46e88-37686e2efb2mr449187eec.41.1794338834273;
        Tue, 10 Nov 2026 11:27:14 -0800 (PST)
Received: from [10.229.42.90] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm9953171eec.17.2026.11.10.11.27.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 11:27:13 -0800 (PST)
Message-ID: <936ee9c7-a59a-425b-870b-8e8fcfcf9eec@broadcom.com>
Date: Tue, 10 Nov 2026 20:27:09 +0100
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH wireless-next 00/17] wifi: add a driver for Broadcom
 BCM4323x USB adapters
To: Ragul Balaji <ragulbaby@gmail.com>
Cc: linux-wireless@vger.kernel.org, Johannes Berg
 <johannes@sipsolutions.net>, brcm80211@lists.linux.dev
References: <20261026053633.361454-1-ragulbaby@gmail.com>
 <f79112b0-d4a3-49a7-aec7-190ad4951bb1@broadcom.com>
 <CAJnRr=r=XMRcJEdM31DK+Z+bEJoz7gvLwS6XbHQSL+iN4+Krvw@mail.gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <CAJnRr=r=XMRcJEdM31DK+Z+bEJoz7gvLwS6XbHQSL+iN4+Krvw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/11/2026 18:01, Ragul Balaji wrote:
> On Sun, Nov 8, 2026 at 1:55 PM Arend van Spriel
> <arend.vanspriel@broadcom.com> wrote:
>>
>> On 26/10/2026 06:36, Ragul Balaji wrote:
>>> This series adds support for the following 802.11n USB adapters:
>>> - Broadcom BCM43231 (Netgear WNA3100, Dynex DX-NUSB)
>>> - BCM4323 (Netgear WNDA3100v2, Belkin F9L1101 and others)
>>>
>>>
>>> The protocol was inferred from USB captures of the vendor's
>>> Windows driver, cross referenced with code from brcmsmac, brcmfmac and b43.
>>> The code which are copied almost as-is from the referenced drivers
>>> are indicated in the comments of the code
>>>
>>> The driver supports:
>>>
>>> - station, P2P client and monitor interfaces
>>> - HT20 and HT40, A-MPDU and A-MSDU transmission
>>> - 2.4 GHz channels 1-14 and, on the BCM4323, 5 GHz channels 36-165
>>> - hardware CCMP with management frame protection
>>> - the LEDs and the WPS button
>>>
>>> Power save, AP, P2P GO, IBSS and mesh interfaces and hardware
>>> TKIP/WEP can be added in later patches
>> This is really old cruft and it is a different driver architecture.
>> Within Broadcom we called it BMAC and when we upstreamed the brcm80211
>> drivers this architecture was already going to be abandoned. The term
>> BMAC is also found in brcmsmac code base so it is easy to see where the
>> split was made for the RPC interface.
>>
>> Generally speaking I am a strong believer of reuse, but this series is
>> touching the other drivers more than I like. I would rather split it in
>> two series so we can apply the patches touching the existing drivers
>> first and assure that there are no regressions. Then add the "new" BMAC
>> driver.
> Ok that makes sense. we will split it up into brcmfmac, brcmsmac and
> the driver files.
> Qn for you: should we rename this to "brcmbmac" or is this current name fine?

It does feel more aligned with the other drivers to use brcmbmac, but on 
the other hand what's in a name. Personally I would go with brcmbmac, 
but I can go either way.

Regards,
Arend
