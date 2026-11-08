Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794162012;
	b=EN2/RUFComxNTKilbRUXinshhYuPMBs+Y9UnHb89aCwFE9TLQ3miV5qndtKJ6Bo6aLWV
	 YbQRoqw0imypj5XaVFQbHE/F3UDs7ootFVsew21kznHFLQZSK1IiH+aCaYz9A1peTxmfW
	 fVJ6GJCrCph1/okCEoSpSOO0nJL9K5OsCWWmSEa2x/eEWL0WLPTgXl6AD6QB5VP4AyeyP
	 1Z2UZ+I8ViaKA8P9oMgea4uSbm7aQ8KeqJ0W6HLsmI/1Vnj6rfnyQ5/TZ4ZvFWSQRppM8
	 gXAS3TDe451hkEDi46A8D5njrRkqLzylXA6JV6PwSvOwecog76IiOKJCS8pfBKFOTHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794162012;
	h=DMARC-Filter:Date:X-Lima-ML-UUID:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=I1oaPtMYd1CpuNQ+9RV9pHUSZcdWTLTk3KLAz0I7Ch0=;
	b=p9DKhB6EhIkeUViVQn7Wg2UAqRGiK+MVCPovT6ywoVynY8cgkAQ1bR4yAhYLR3y4Ewx9
	 VjB0O1BSTd4+r746pOLNwr6wVPQFQ/luuIkjHCZdGtiknC+7Argu4O4RRk6xzXPalWB2Z
	 tvLcR1Rxl5iLQm3CMRlKQnp51vvmTS2A7Lkuyxjhf8nB3qmwAaUYZntWUKGoWzgafGRJC
	 08O1K4hYgva7rZa5qOu+43bV/xCfNmZJ7eGsjoNNlxRmbjAaM9AmrE5XB1Al8iKyDuwDb
	 hWxFH1algmYYmc0KQphewHDCUXXymlQMDar2FaZDODGxilLNWsuRgcYMxazQMa9i5cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=hGCaEe0V;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD49D606A320
	for <brcm80211@lists.linux.dev>; Sun,  8 Nov 2026 18:20:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD49D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=hGCaEe0V
Date: Sun, 8 Nov 2026 19:20:00 +0100
X-Lima-ML-UUID: 31c93440-a169-4383-9b5a-bcdeee7649e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1794162002;
	bh=I1oaPtMYd1CpuNQ+9RV9pHUSZcdWTLTk3KLAz0I7Ch0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hGCaEe0VjzEMBXn7xs/UKaj1ZXlPeFL9R85SWBzQWXZEqnlcmPlLUECB3jMrK0aGq
	 g3SiWWoonspu2pemV+70VeFWpbKD09snI2l6LkXyLgLahuj8CL6WrTpUDto+JaARYl
	 23LvzYg/g/zHwfDFXCdLo84bji7SIn8lePgfyX4IKXEKxFwWKhFILeCq3kLVPtEY06
	 ZDR6cMkOkLgbFJOIOk4/SKqd7+ud2avndL/4/KDSRRa4TIa/4S+oiDQlQ7aBsurehU
	 eHT51WlWEknjeKNCQD2v5vcfkHvJ97qfabt9alAcZu9ju8Ex31VJTLm1k56ZBjVVXI
	 xKXYZfBjPEOuA==
From: =?UTF-8?B?QW5kcsOp?= Eikmeyer <dev@deq.rocks>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] wifi: brcmfmac: AWDL for AirDrop on Apple T2 Macs
Message-ID: <20261108192000.2a1d416e@kait2en-mbp15-1>
In-Reply-To: <c93fa1b2-9d05-4536-9025-6c4d1e6e6b5f@broadcom.com>
References: <20261104151547.70333-1-dev@deq.rocks>
	<c93fa1b2-9d05-4536-9025-6c4d1e6e6b5f@broadcom.com>
Organization: KaiT2en
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 8 Nov 2026 16:41:37 +0100
Arend van Spriel <arend.vanspriel@broadcom.com> wrote:

> I really have no idea how to deal with this series. AWDL is not part
> of the IEEE 802.11 so I can imagine the kernel wireless subsystem
> does not care to support this. From driver perspective I am not keen
> on supporting this upstream either. My limited understanding of AWDL
> was that it was Apple's variant of TDLS (802.11z).
>
> So what does AWDL provide to user-space and could the same be
> accomplished by TDLS?

Hi Arend,

I think I can be direct here. My submission is a long shot. If I were in
your place I wouldn't be keen on it either...

But! AirDrop is the feature people miss most when they move from macOS
to Linux. Also you may have noticed Google reversed AirDrop in early
2026 and newer Pixel and Samsung devices ship with it. So there is a
huge demand. Especially for former macOS users. Those often have a
complete Airdrop "ecosystem" at home. Personally, I don't use it. But
that is what I was told by our community members.

However, on our Macs the firmware already implements AWDL, the driver is
the only missing piece. And it will work on T2 and Apple Silicon Macs
alike. Maybe even on some pre-T2 Macs. So we would give a huge ammount
of users big grins on their faces.

--

Re TDLS: to my understanding, TDLS needs both peers associated to the
same AP. AWDL needs no AP at all. The peers agree on availability
windows and a channel schedule among themselves, so two devices
exchange data while they are on different networks or on no network at
all. Like on a train or at a customer site. That is what AirDrop
depends on, and it is why it can't be built on TDLS.

IIRC the closest standard is Wi-Fi Aware (NAN), not TDLS. But... to be
perfectly honest with you. If we can't get awdl into the kernel, I am
not keen on changing it to NAN. Then let one of those kernel modifying
distros pick it up and let them do what they want.

> From the explanation above it seems AWDL provides more knobs to
> user-space, but not sure whether the awdl%d interface is merely a
> control interface or actually passing data through it (patch 5
> implies it does).

It passes data. awdl%d is the data interface, AirDrop runs over IPv6
link-local on it. The vendor commands only carry the AWDL action
frames and the peer setup, the schedule itself runs in the firmware.

> If my memory does not fail me then adding vendor commands is
> generally pushed back.

Agreed. They wont like it. Hence "long shot". But worth a try maybe.
nl80211 has no AWDL interface type, which is why I went with vendor
commands. If there is any interface you and Johannes would rather see,
let me know.


Best,
Andre
